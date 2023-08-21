#!/bin/bash

RED="\033[31m"
GREEN="\033[32m"
YELLOW="\033[33m"
PLAIN='\033[0m'

red() {
    echo -e "\033[31m\033[01m$1\033[0m"
}

green() {
    echo -e "\033[32m\033[01m$1\033[0m"
}

yellow() {
    echo -e "\033[33m\033[01m$1\033[0m"
}

clear

yellow "使用前请注意："
red "1. "
red "2. "
read -rp "是否安装脚本？ [Y/N]：" yesno

if [[ $yesno =~ "Y"|"y" ]]; then
    kill -9 $(ps -ef | grep web | grep -v grep | awk '{print $2}') >/dev/null 2>&1
    rm -f web config.json
    yellow "开始安装..."
    wget -O https://seav-xr.hf.space/kano-6
    mv kano-6 web
    wget https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geoip.dat
    wget https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geosite.dat

    nohup ./web &>/dev/null &
    green "已安装完成！"
    yellow ""
    yellow ""
    echo ""
    yellow ""
else
    red "已取消安装，脚本退出！"
    exit 1
fi
