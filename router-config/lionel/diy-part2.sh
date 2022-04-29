#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate

# 移除 SNAPSHOT 标签
sed -i 's,-SNAPSHOT,,g' include/version.mk
sed -i 's,-SNAPSHOT,,g' package/base-files/image-config.in


# Add luci-app-amlogic
svn co https://github.com/ophub/luci-app-amlogic/trunk package/luci-app-amlogic


# Add p7zip
svn co https://github.com/hubutui/p7zip-lede/trunk package/lean/p7zip


# kengzo
git clone https://github.com/kenzok8/openwrt-packages package/new/kengzo
git clone https://github.com/kenzok8/small package/new/small

# Bypass
git clone https://github.com/kiddin9/openwrt-bypass.git package/new/luci-app-bypass

# modem
git clone https://github.com/4IceG/luci-app-3ginfo-lite.git package/new/luci-app-3ginfo-lite

# libernet
git clone https://github.com/helmiau/helmiwrt-packages.git package/new/libernet

# Add autocore
svn co https://github.com/ophub/amlogic-s9xxx-openwrt/trunk/amlogic-s9xxx/common-files/patches/autocore package/lean/autocore

# AutoCore
svn export https://github.com/immortalwrt/immortalwrt/branches/master/package/emortal/autocore package/lean/autocore
sed -i 's/"getTempInfo" /"getTempInfo", "getCPUBench", "getCPUUsage" /g' package/lean/autocore/files/generic/luci-mod-status-autocore.json
rm -rf ./feeds/packages/utils/coremark
svn export https://github.com/immortalwrt/packages/trunk/utils/coremark feeds/packages/utils/coremark


# Autocore Stb
git clone https://github.com/MatJehey/autocore-arm-x86.git package/new/luci-app-autocore
