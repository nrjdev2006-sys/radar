#!/usr/bin/env python3
"""Patch the generated Xilinx lwIP GEM PHY setup for Zybo RTL8211F."""
from __future__ import annotations
import argparse
from pathlib import Path

p = argparse.ArgumentParser()
p.add_argument("bsp_root", type=Path, help="generated BSP root (contains ps7_cortexa9_0)")
a = p.parse_args()
netif = a.bsp_root / "ps7_cortexa9_0/libsrc/lwip220_v1_1/src/lwip-2.2.0/contrib/ports/xilinx/netif"
phy = netif / "xemacpsif_physpeed.c"
hw = netif / "xemacpsif.c"
if not phy.exists() or not hw.exists():
    raise SystemExit(f"generated lwIP GEM source not found below {a.bsp_root}")
s = phy.read_text()
start = s.index("static u32_t get_Realtek_phy_speed")
end = s.index("static u32_t get_Adi_phy_speed", start)
c = s[start:end]
# Add locals required by the RTL8211F page-aware branch.
if "u16_t phy_identity;" not in c:
    c = c.replace("\tu16_t status_speed;\n", "\tu16_t status_speed;\n\tu16_t phy_identity;\n\tu16_t old_page;\n", 1)
# Set the RTL8211F's RGMII clock delays on the F-specific page. Zybo's RGMII
# wiring expects internal TX/RX delay; the Xilinx generic path handles E parts.
marker = "0x0d08"
if marker not in c:
    c = c.replace(
        '\txil_printf("Start PHY autonegotiation \\r\\n");\n\n',
        '\txil_printf("Start PHY autonegotiation \\r\\n");\n\n'
        '\t/* RTL8211F: enable Zybo RGMII TX/RX clock delays (page 0xd08). */\n'
        '\tXEmacPs_PhyRead(xemacpsp, phy_addr, PHY_IDENTIFIER_2_REG, &phy_identity);\n'
        '\tif (phy_identity == 0xc916) {\n'
        '\t\tXEmacPs_PhyRead(xemacpsp, phy_addr, 0x1f, &old_page);\n'
        '\t\tXEmacPs_PhyWrite(xemacpsp, phy_addr, 0x1f, 0x0d08);\n'
        '\t\tXEmacPs_PhyRead(xemacpsp, phy_addr, 0x11, &status_speed);\n'
        '\t\tXEmacPs_PhyWrite(xemacpsp, phy_addr, 0x11, status_speed | 0x0100);\n'
        '\t\tXEmacPs_PhyRead(xemacpsp, phy_addr, 0x15, &status_speed);\n'
        '\t\tXEmacPs_PhyWrite(xemacpsp, phy_addr, 0x15, status_speed | 0x0008);\n'
        '\t\tXEmacPs_PhyWrite(xemacpsp, phy_addr, 0x1f, old_page);\n'
        '\t}\n\n', 1)
# Reset before ANRESTART; a reset after it cancels the negotiation.
old = '''\tXEmacPs_PhyRead(xemacpsp, phy_addr, IEEE_AUTONEGO_ADVERTISE_REG, &control);
\tcontrol |= IEEE_ASYMMETRIC_PAUSE_MASK;
\tcontrol |= IEEE_PAUSE_MASK;
\tcontrol |= ADVERTISE_100;
\tcontrol |= ADVERTISE_10;
\tXEmacPs_PhyWrite(xemacpsp, phy_addr, IEEE_AUTONEGO_ADVERTISE_REG, control);

\tXEmacPs_PhyRead(xemacpsp, phy_addr, IEEE_1000_ADVERTISE_REG_OFFSET,
\t\t\t\t\t&control);
\tcontrol |= ADVERTISE_1000;
\tXEmacPs_PhyWrite(xemacpsp, phy_addr, IEEE_1000_ADVERTISE_REG_OFFSET,
\t\t\t\t\tcontrol);

\tXEmacPs_PhyRead(xemacpsp, phy_addr, IEEE_CONTROL_REG_OFFSET, &control);
\tcontrol |= IEEE_CTRL_AUTONEGOTIATE_ENABLE;
\tcontrol |= IEEE_STAT_AUTONEGOTIATE_RESTART;
\tXEmacPs_PhyWrite(xemacpsp, phy_addr, IEEE_CONTROL_REG_OFFSET, control);

\tXEmacPs_PhyRead(xemacpsp, phy_addr, IEEE_CONTROL_REG_OFFSET, &control);
\tcontrol |= IEEE_CTRL_RESET_MASK;
\tXEmacPs_PhyWrite(xemacpsp, phy_addr, IEEE_CONTROL_REG_OFFSET, control);

\twhile (1) {
\t\tXEmacPs_PhyRead(xemacpsp, phy_addr, IEEE_CONTROL_REG_OFFSET, &control);
\t\tif (control & IEEE_CTRL_RESET_MASK)
\t\t\tcontinue;
\t\telse
\t\t\tbreak;
\t}
'''
new = '''\t/* Reset first; resetting after ANRESTART cancels negotiation. */
\tXEmacPs_PhyRead(xemacpsp, phy_addr, IEEE_CONTROL_REG_OFFSET, &control);
\tcontrol |= IEEE_CTRL_RESET_MASK;
\tXEmacPs_PhyWrite(xemacpsp, phy_addr, IEEE_CONTROL_REG_OFFSET, control);
\tdo {
\t\tXEmacPs_PhyRead(xemacpsp, phy_addr, IEEE_CONTROL_REG_OFFSET, &control);
\t} while (control & IEEE_CTRL_RESET_MASK);

\tXEmacPs_PhyRead(xemacpsp, phy_addr, IEEE_AUTONEGO_ADVERTISE_REG, &control);
\tcontrol |= IEEE_ASYMMETRIC_PAUSE_MASK | IEEE_PAUSE_MASK | ADVERTISE_100 | ADVERTISE_10;
\tXEmacPs_PhyWrite(xemacpsp, phy_addr, IEEE_AUTONEGO_ADVERTISE_REG, control);
\tXEmacPs_PhyRead(xemacpsp, phy_addr, IEEE_1000_ADVERTISE_REG_OFFSET, &control);
\tcontrol |= ADVERTISE_1000;
\tXEmacPs_PhyWrite(xemacpsp, phy_addr, IEEE_1000_ADVERTISE_REG_OFFSET, control);
\tXEmacPs_PhyRead(xemacpsp, phy_addr, IEEE_CONTROL_REG_OFFSET, &control);
\tcontrol |= IEEE_CTRL_AUTONEGOTIATE_ENABLE | IEEE_STAT_AUTONEGOTIATE_RESTART;
\tXEmacPs_PhyWrite(xemacpsp, phy_addr, IEEE_CONTROL_REG_OFFSET, control);
'''
if "Reset first; resetting after ANRESTART cancels negotiation." not in c:
    if old not in c:
        raise SystemExit("unrecognized Xilinx PHY setup block; refusing a partial patch")
    c = c.replace(old, new, 1)
# Allow gigabit partners enough time after the explicit reset.
c = c.replace("if (timeout_counter == 5) {", "if (timeout_counter == 30) {", 1)
# RTL8211F PHYSR is in page 0xa43; restore page after reading it.
if "phy_identity == 0xc916" not in c:
    raise SystemExit("RTL8211F delay setup missing")
if "status_speed & 0x0004" not in c:
    old_decode = '''\tXEmacPs_PhyRead(xemacpsp, phy_addr,IEEE_SPECIFIC_STATUS_REG,
\t\t\t\t\t&status_speed);
\tif (status_speed & 0x400) {'''
    new_decode = '''\tXEmacPs_PhyRead(xemacpsp, phy_addr, PHY_IDENTIFIER_2_REG, &phy_identity);
\tif (phy_identity == 0xc916) {
\t\tXEmacPs_PhyRead(xemacpsp, phy_addr, 0x1f, &old_page);
\t\tXEmacPs_PhyWrite(xemacpsp, phy_addr, 0x1f, 0x0a43);
\t\tXEmacPs_PhyRead(xemacpsp, phy_addr, 0x1a, &status_speed);
\t\tXEmacPs_PhyWrite(xemacpsp, phy_addr, 0x1f, old_page);
\t\tif (status_speed & 0x0004) {
\t\t\tswitch (status_speed & 0x0030) {
\t\t\tcase 0x0020: return 1000;
\t\t\tcase 0x0010: return 100;
\t\t\tdefault: return 10;
\t\t\t}
\t\t}
\t\treturn XST_FAILURE;
\t}
\tXEmacPs_PhyRead(xemacpsp, phy_addr,IEEE_SPECIFIC_STATUS_REG, &status_speed);
\tif (status_speed & 0x400) {'''
    if old_decode not in c:
        raise SystemExit("unrecognized Realtek speed decode; refusing a partial patch")
    c = c.replace(old_decode, new_decode, 1)
phy.write_text(s[:start] + c + s[end:])
# Propagate DMA-ring initialization failures instead of reporting a false UDP-ready state.
h = hw.read_text()
old_hw = "\tsetup_isr(xemac);\n\tinit_dma(xemac);\n\tstart_emacps(xemacpsif);"
new_hw = "\tsetup_isr(xemac);\n\tstatus = init_dma(xemac);\n\tif (status != XST_SUCCESS) return ERR_IF;\n\tstart_emacps(xemacpsif);"
if old_hw in h:
    hw.write_text(h.replace(old_hw, new_hw, 1))
print(f"Patched {phy}")

