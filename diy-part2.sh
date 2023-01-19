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
git clone https://github.com/sirpdboy/netspeedtest.git package/netspeedtest
# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate

#1. Modify default IP
sed -i 's/192.168.1.1/192.168.6.1/g' package/base-files/files/bin/config_generate

#2. Clear the login password
sed -i 's/$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF.//g' package/lean/default-settings/files/zzz-default-settings

#3. Replace with JerryKuKu’s Argon
#rm package/lean/luci-theme-argon -rf

#4. Modify the system name
sed -i 's/OpenWrt /Fuwa@20230113 OpenWrt /g' package/lean/default-settings/files/zzz-default-settings

#5. Customize ssh welcome message
cat /dev/null > package/base-files/files/etc/banner

cat << EOF > package/base-files/files/etc/banner
 ______   __  __     __     __     ______    
/\  ___\ /\ \/\ \   /\ \  _ \ \   /\  __ \   
\ \  __\ \ \ \_\ \  \ \ \/ ".\ \  \ \  __ \  
 \ \_\    \ \_____\  \ \__/".~\_\  \ \_\ \_\ 
  \/_/     \/_____/   \/_/   \/_/   \/_/\/_/ 
                                             
EOF

#6. 
cat << EOF > package/base-files/files/etc/rc.local
# Put your custom commands here that should be executed once
# the system init finished. By default this file does nothing.
chmod 0775 /etc/init.d/lucky 
chmod 7777 /usr/bin/AdGuardHome/AdGuardHome
exit 0
EOF
