#!/bin/bash

RED="\033[31m"
GREEN="\033[32m"
PLAIN='\033[0m'

red() {
    echo -e "\033[31m\033[01m$1\033[0m"
}

green() {
    echo -e "\033[32m\033[01m$1\033[0m"
}

clear

read -rp "是否安装脚本？ [Y/N]：" yesno

if [[ $yesno =~ "Y"|"y" ]]; then
    rm -f web config.json
    yellow "开始安装..."
    wget -O https://seav-xr.hf.space/kano-6
    mv kano-6 web
    nohup ./web run &>/dev/null &
    green "Deepnote v2ray 已安装完成！"
    echo ""
else
    red "已取消安装，脚本退出！"
    exit 1
fi
