path=/home/MyDocker
cd $path
# 源备份
cp /etc/apt/sources.list /etc/apt/sources.list.pak
# 换源
rm -f /etc/apt/sources.list
cp sources.list /etc/apt/sources.list
#
apt update
apt install -y curl
apt install -y systemctl
apt install -y wget

# code-server的准备与安装
mkdir ../code-server
cd ../code-server
# 从gitee上下载code-server安装包的切片
wget -P . https://gitee.com/itlantu/MyDocker/releases/download/4.7/xaa
wget -P . https://gitee.com/itlantu/MyDocker/releases/download/4.7/xab
# 合成完成的deb并安装
cat xaa xab > code-server.deb
dpkg –i code-server.deb
# 删除安装包文件
rm -f xaa
rm -f xab
rm -f code-server.deb
rm code-server


#vscode初始化配置
mkdir /home/coder
mkdir ~/.config/
mkdir ~/.config/code-server
touch ~/.config/code-server/config.yaml
\cp $path/script/config.yaml ~/.config/code-server/config.yaml


