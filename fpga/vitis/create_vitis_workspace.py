import os
import ctypes
import shutil
import vitis


def short_path(path):
    buffer = ctypes.create_unicode_buffer(32768)
    length = ctypes.windll.kernel32.GetShortPathNameW(path, buffer, len(buffer))
    if length == 0 or length >= len(buffer):
        raise OSError(f"Could not resolve a Windows short path for: {path}")
    return buffer.value


script_dir = os.path.dirname(os.path.abspath(__file__))
fpga_dir = os.path.dirname(script_dir)
workspace_dir = os.environ.get(
    "RADAR_VITIS_WORKSPACE",
    os.path.join(script_dir, "radar_workspace_vitis"),
)
workspace = os.path.abspath(workspace_dir)
xsa_path = os.environ.get(
    "RADAR_XSA",
    os.path.join(fpga_dir, "vivado", "radar_vivado_project", "radar_hardware.xsa"),
)
xsa = short_path(xsa_path)
app_source_dir = short_path(os.path.join(script_dir, "app_src"))
driver_source_dir = short_path(os.path.join(fpga_dir, "ps"))
platform_source_dir = os.path.join(
    os.environ.get("RADAR_VITIS_HOME", os.environ.get("XILINX_VITIS", "")),
    "data", "embeddedsw", "lib", "sw_apps", "lwip_udp_perf_server", "src",
)

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
    generate_dtb=False,
)
domain = platform.get_domain(name="standalone_a9_0")
domain.set_lib(lib_name="lwip220")
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
    template="empty_application",
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
if not os.path.isfile(os.path.join(platform_source_dir, "platform.c")):
    raise FileNotFoundError("Vitis lwIP platform support source was not found: " + platform_source_dir)
staged_platform_source = os.path.join(workspace, "radar_lwip_platform.c")
shutil.copy2(os.path.join(platform_source_dir, "platform.c"), staged_platform_source)
shutil.copy2(os.path.join(platform_source_dir, "platform.h"), os.path.join(workspace, "platform.h"))
app.import_files(
    from_loc=short_path(workspace),
    files=["radar_lwip_platform.c", "platform.h"],
    dest_dir_in_cmp="src",
)
app.import_files(
    from_loc=app_source_dir,
    files=["platform_config.h"],
    dest_dir_in_cmp="src",
)
app.build()
app_elf = os.path.join(workspace, "radar_ps_app", "build", "radar_ps_app.elf")
if not os.path.isfile(app_elf):
    raise RuntimeError("Vitis did not produce the PS application ELF: " + app_elf)

print(f"VITIS_PLATFORM_PASS {platform_xpfm}")
print(f"VITIS_APP_PASS {app_elf}")
vitis.dispose()


