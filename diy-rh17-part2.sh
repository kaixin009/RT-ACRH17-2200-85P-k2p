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
sed -i 's/192.168.1.1/192.168.50.1/g' package/base-files/files/bin/config_generate

# Modify model
sed -i 's/model = "ASUS RT-ACRH17"/model = "ASUS RT-AC2200"/g' target/linux/ipq40xx/files/arch/arm/boot/dts/qcom-ipq4019-rt-acrh17.dts

# 删除原来的adbyby
rm -rf  feeds/luci/applications/luci-app-adbyby-plus
svn co https://github.com/NueXini/NueXini_Packages/trunk/luci-app-adbyby-plus package/lean/luci-app-adbyby-plus
svn co https://github.com/281677160/openwrt-package/trunk/luci-app-smartdns package/lean/luci-app-smartdns

# 删除原来的luci-app-eqos
rm -rf  feeds/luci/applications/luci-app-eqos

# 删除原来的argon
rm -rf  feeds/luci/themes/luci-theme-argon

# 添加老竭力的argon主题
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git package/lean/luci-theme-argon

# 修改默认主题为argon
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# 修改密码为空，自定义名称
ZZZ="package/lean/default-settings/files/zzz-default-settings"

sed -i '/CYXluq4wUazHjmCDBCqXF/d' $ZZZ

sed -i 's/set wireless.default_radio${devidx}.ssid=OpenWrt/set wireless.default_radio0.ssid=RT-ACRH17_5G/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh

sed -i '/set wireless.default_radio0.ssid=RT-ACRH17_5G/a\ set wireless.default_radio1.ssid=RT-ACRH17' package/kernel/mac80211/files/lib/wifi/mac80211.sh

#git clone https://github.com/small-5/luci-app-adblock-plus.git package/lean/luci-app-adblock-plus

git clone https://github.com/wiwizcom/WiFiPortal.git package/wifidog-wiwiz

git clone https://github.com/sirpdboy/netspeedtest.git package/netspeedtest
