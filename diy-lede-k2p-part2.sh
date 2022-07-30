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

# 删除原来的adbyby
rm -rf  feeds/luci/applications/luci-app-adbyby-plus
svn co https://github.com/NueXini/NueXini_Packages/trunk/luci-app-adbyby-plus package/lean/luci-app-adbyby-plus

# 删除原来的ssr
# rm -rf  feeds/luci/applications/luci-app-ssr-plus
# git clone https://github.com/fw876/helloworld package/luci-app-ssr-plus

# 删除原来的luci-app-eqos
# rm -rf  feeds/luci/applications/luci-app-eqos

# 删除原来的argon
# rm -rf  feeds/luci/themes/luci-theme-argon

# 添加老竭力的argon主题
# git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git package/luci-theme-argon

# 修改默认主题为argon
# sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# 修改密码为空，自定义名称
ZZZ="package/lean/default-settings/files/zzz-default-settings"
sed -i '/CYXluq4wUazHjmCDBCqXF/d' $ZZZ

# sed -i 's/set wireless.default_radio${devidx}.ssid=OpenWrt/set wireless.default_radio0.ssid=Phicomm-k2p_5G/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh

# sed -i '/set wireless.default_radio0.ssid=Phicomm-k2p_5G/a\ set wireless.default_radio1.ssid=Phicomm-k2p' package/kernel/mac80211/files/lib/wifi/mac80211.sh

# 2.修改主机名
#sed -i 's/OpenWrt/Openwrt-K2P/g' package/base-files/files/bin/config_generate

# 4.修改版本号
# sed -i "s/OpenWrt /dream by $(TZ=UTC-8 date "+%Y.%m.%d") @ OpenWrt /g" package/lean/default-settings/files/zzz-default-settings


# 6.设置ttyd免登录
# sed -i 's/\/bin\/login/\/bin\/login -f root/' /etc/config/ttyd

#修改内核版本
# sed -i s/5.10/5.4/g target/linux/ramips/Makefile

# 7.修正连接数（by ベ七秒鱼ベ）
# sed -i '/customized in this file/a net.netfilter.nf_conntrack_max=165535' package/base-files/files/etc/sysctl.conf

# git clone https://github.com/small-5/luci-app-adblock-plus.git package/lean/luci-app-adblock-plus

git clone https://github.com/wiwizcom/WiFiPortal.git package/wifidog-wiwiz

# git clone https://github.com/fw876/helloworld package/lean/luci-app-ssr-plus

# git clone https://github.com/xiaorouji/openwrt-passwall package/lean/luci-app-passwall
