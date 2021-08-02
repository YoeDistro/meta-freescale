# what vivante driver does libsdl2 mean? Anyway it fails with missing functions as
# VIVANTE_Create VIVANTE_GLES_GetProcAddress VIVANTE_GLES_UnloadLibrary ...
EXTRA_OECONF:append:imxgpu2d = " --disable-video-vivante"

CFLAGS:append:imxgpu = " -DLINUX \
    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', '', '-DEGL_API_FB', d)} \
    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', '-DWL_EGL_PLATFORM', '', d)} \
"
