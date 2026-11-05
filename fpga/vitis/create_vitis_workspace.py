import os
import ctypes
import vitis


def short_path(path):
    buffer = ctypes.create_unicode_buffer(32768)
    length = ctypes.windll.kernel32.GetShortPathNameW(path, buffer, len(buffer))
    if length == 0 or length >= len(buffer):
        raise OSError(f"Could not resolve a Windows short path for: {path}")
    return buffer.value


script_dir = os.path.dirname(os.path.abspath(__file__))
fpga_dir = os.path.dirname(script_dir)
workspace_dir = os.path.join(script_dir, "radar_workspace_vitis")
os.makedirs(workspace_dir, exist_ok=True)
workspace = short_path(workspace_dir)
xsa = short_path(os.path.join(fpga_dir, "vivado", "radar_vivado_project", "radar_hardware.xsa"))
app_source_dir = short_path(os.path.join(script_dir, "app_src"))
driver_source_dir = short_path(os.path.join(fpga_dir, "ps"))

if not os.path.isfile(xsa):
    raise FileNotFoundError(f"Vivado XSA is missing: {xsa}")

client = vitis.create_client()
client.set_workspace(path=workspace)

platform = client.create_platform_component(
    name="radar_platform",
    hw_design=xsa,
    cpu="ps7_cortexa9_0",
    os="standalone",
    domain_name="standalone_a9_0",
)
platform.build()

platform_xpfm = os.path.join(
    workspace,
    "radar_platform",
    "export",
    "radar_platform",
    "radar_platform.xpfm",
)
if not os.path.isfile(platform_xpfm):
    # Locate the generated XPFM if Vitis chooses a slightly different export folder.
    for root, _dirs, files in os.walk(os.path.join(workspace, "radar_platform")):
        if "radar_platform.xpfm" in files:
            platform_xpfm = os.path.join(root, "radar_platform.xpfm")
            break
if not os.path.isfile(platform_xpfm):
    raise FileNotFoundError("Vitis platform build did not produce radar_platform.xpfm")

app = client.create_app_component(
    name="radar_ps_app",
    platform=platform_xpfm,
    domain="standalone_a9_0",
    template="empty",
)
app.import_files(
    from_loc=app_source_dir,
    files=["main.c"],
    dest_dir_in_cmp="src",
)
app.import_files(
    from_loc=driver_source_dir,
    files=["radar_driver.c", "radar_driver.h"],
    dest_dir_in_cmp="src",
)
app.build()

print(f"VITIS_PLATFORM_PASS {platform_xpfm}")
print(f"VITIS_APP_PASS {os.path.join(workspace, 'radar_ps_app')}")
vitis.dispose()


