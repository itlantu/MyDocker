mkdir /home/coder
# 从gitee下载源


# 备份源
cp /etc/apt/sources.list /etc/apt/sources.list.pak
# 换源
\cp /home/MyDocker/sources.list /etc/apt/sources.list

apt update

apt install -y git
apt install -y curl
apt install -y systemctl
apt install -y vim

bash /home/MyDocker/vs-code.install.sh
bash /home/MyDocker/init.sh