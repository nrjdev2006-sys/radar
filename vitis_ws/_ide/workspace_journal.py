# 2026-11-03T09:51:51.236464100
import vitis

client = vitis.create_client()
client.set_workspace(path="vitis_ws")

platform = client.create_platform_component(name = "radar_platform",hw_design = "$COMPONENT_LOCATION/../../vivado/radar_system_wrapper.xsa",os = "standalone",cpu = "ps7_cortexa9_0",domain_name = "standalone_domain",generate_dtb = True)

