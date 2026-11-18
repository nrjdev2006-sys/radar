# 2026-11-17T14:51:47.769784100
import vitis

client = vitis.create_client()
client.set_workspace(path="radar_vitis_workspace")

platform = client.create_platform_component(name = "radar_platform",hw_design = "$COMPONENT_LOCATION/../../../../../ZYNQ-R~2/fpga/vivado/RADAR_~1/RADAR_~1.XSA",os = "standalone",cpu = "ps7_cortexa9_0",domain_name = "standalone_a9_0")

vitis.dispose()

