#!/bin/bash
perl -i -pe 's/HOME\=INVALIDVAL/HOME\=\/home\/aaron\/ti/g' web.test
perl -i -pe 's/GRAPHICS_INSTALL_DIR\=\$\(HOME\)\/OMAP35x_Android_Graphics_SDK_3_01_00_03/GRAPHICS_INSTALL_DIR\=\$\(HOME\)\/SGX_SDK\/OMAP35x_Android_Graphics_SDK_3_01_00_03/g' web.test
perl -i -pe 's/ANDROID_ROOT\=\$\(HOME\)\/INVALIDVAL/ANDROID_ROOT\=\$\(HOME\)\/rowboat\-android\-2.2\/out\/target\/product\/beagleboard\/android_rootfs/g' web.test
perl -i -pe 's/CSTOOL_DIR\=INVALIDVAL/CSTOOL_DIR\=\$\(HOME\)\/prebuilt\/linux\-x86\/toolchain\/arm\-eabi\-4\.4\.0/g' web.test
perl -i -pe 's/KERNEL_INSTALL_DIR\=\$\(HOME\)\/INVALIDVAL/KERNEL_INSTALL_DIR\=\$\(HOME\)\/rowboat\-android\-2\.2\/kernel/g' web.test
perl -i -pe 's/\# adbd is controlled by the persist\.service\.adb\.enable system property/\# adbd is controlled by the persist\.service\.adb\.enable system property\n\# Start PowerVR SGX DDK\nservice pvr \/system\/bin\/sgx\/rc\.pvr start/g' web.test
