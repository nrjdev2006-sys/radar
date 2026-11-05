"""Create and build the Zybo Z7-10 Vitis standalone platform diagnostically.

Run this with Vitis' bundled Python, using run_platform_check.ps1.
"""

from __future__ import print_function

import os
import sys
import traceback


vitis_home = os.environ.get("RADAR_VITIS_HOME") or os.environ.get("XILINX_VITIS")
vivado_home = os.environ.get("RADAR_VIVADO_HOME") or os.environ.get("XILINX_VIVADO")
xsa_path = os.environ.get("RADAR_XSA")
workspace = os.environ.get("RADAR_VITIS_WORKSPACE")
sdt_repo = os.environ.get("VITIS_SDT_REPO")

if not vitis_home:
    raise SystemExit("RADAR_VITIS_HOME/XILINX_VITIS is not set")
if not xsa_path or not os.path.isfile(xsa_path):
    raise SystemExit("RADAR_XSA is missing or does not exist: {!r}".format(xsa_path))
if not workspace:
    raise SystemExit("RADAR_VITIS_WORKSPACE is not set")

if vivado_home:
    os.environ["XILINX_VIVADO"] = vivado_home
if sdt_repo and os.path.isdir(sdt_repo):
    os.environ["VITIS_SDT_REPO"] = sdt_repo

# Some Vitis installs do not put XSCT on the Vitis process PATH. Add the
# matching installed XSCT folder when the launcher has provided its location.
xsct_bin = os.environ.get("RADAR_XSCT_BIN")
if xsct_bin and os.path.isdir(xsct_bin):
    os.environ["PATH"] = xsct_bin + os.pathsep + os.environ.get("PATH", "")

print("Vitis home: {}".format(vitis_home))
print("Vivado home: {}".format(vivado_home))
print("XSCT bin: {}".format(xsct_bin))
print("SDT repo: {}".format(os.environ.get("VITIS_SDT_REPO")))
print("XSA: {}".format(xsa_path))
print("Workspace: {}".format(workspace))

compiler_candidates = []
for tool_home in (vitis_home, vivado_home):
    if tool_home:
        compiler_candidates.append(
            os.path.join(
                tool_home,
                "gnu",
                "aarch32",
                "nt",
                "gcc-arm-none-eabi",
                "bin",
                "arm-none-eabi-gcc.exe",
            )
        )
for compiler in compiler_candidates:
    print("ARM compiler {}: {}".format(compiler, os.path.isfile(compiler)))

import vitis  # Must happen after applying environment fixes.

client = None
try:
    client = vitis.create_client()
    client.set_workspace(path=workspace)
    processors = client.get_processor_os_list(xsa=xsa_path)
    print("Processor/OS discovery:\n{}".format(processors))

    platform = client.create_platform_component(
        name="radar_platform",
        hw_design=xsa_path,
        os="standalone",
        cpu="ps7_cortexa9_0",
        domain_name="standalone_a9_0",
        generate_dtb=False,
    )
    print("PLATFORM_CREATED")
    print("Domains: {}".format(platform.list_domains()))

    domain = platform.get_domain(name="standalone_a9_0")
    print("Applicable libraries: {}".format(domain.get_applicable_libs()))
    print("Platform build result: {}".format(platform.build()))
    print("PLATFORM_CHECK_PASSED")
except Exception as error:
    print("PLATFORM_CHECK_FAILED: {!r}".format(error))
    traceback.print_exc()
    sys.exit(1)
finally:
    if client is not None:
        vitis.dispose()
