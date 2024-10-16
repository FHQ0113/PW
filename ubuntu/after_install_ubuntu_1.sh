# ------------------------------------------
# 脚本名称：系统更新及软件安装脚本
# 创建时间：2024年10月16日
# 创建者：peng wei
# 脚本目的：安装完成ubuntu之后，需要执行的step 1
# ------------------------------------------

#!/bin/bash

# 更新软件
sudo apt-get update -y
sudo apt-get upgrade -y

# 安装ssh
sudo apt-get install openssh-client # install 客户端
sudo apt-get install openssh-server  # install 服务端
sudo /etc/init.d/ssh start 

# 检查 SSH 是否在运行
if ps -e | grep -q ssh; then
    echo "SSH 服务正在运行"
else
    echo "SSH 服务未运行"
fi

# 安装一些软件
sudo apt install -y curl
sudo apt install -y git
sudo apt install -y htop
sudo apt install -y pigz

echo "所有软件安装完成！"