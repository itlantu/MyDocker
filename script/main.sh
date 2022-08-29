cd home
mkdir MyDocker
cd MyDocker

# 从github下载源
wget https://raw.githubusercontent.com/itlantu/MyDocker/main/script/vs-code.install.sh
# 备份源
cp /etc/apt/sources.list /etc/apt/sources.list.pak
# 换源
\cp /home/MyDocker/sources.list /etc/apt/sources.list

apt update

apt install -y git
apt install -y curl
apt install -y systemctl
apt install -y vim

# 下载vscode-server
wegt https://raw.githubusercontent.com/itlantu/MyDocker/main/script/vs-code.install.sh
# 运行vscode-server脚本
bash /home/MyDocker/script/vs-code.install.sh
# 执行初始化脚本
bash /home/MyDocker/script/init.sh