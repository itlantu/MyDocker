cd /home
mkdir /home/MyDocker
mkdir /home/coder
cd MyDocker

# 从gitee下载源
wget https://gitee.com/itlantu/my-docker-resources/raw/master/resources/vs-code.install.sh
wget https://gitee.com/itlantu/my-docker-resources/edit/master/resources/init.sh
wget https://gitee.com/itlantu/my-docker-resources/edit/master/resources/sources.list
wget https://gitee.com/itlantu/my-docker-resources/raw/master/resources/config.yaml

# 备份源
cp /etc/apt/sources.list /etc/apt/sources.list.pak
# 换源
\cp /home/MyDocker/sources.list /etc/apt/sources.list

apt update

apt install -y git
apt install -y curl
apt install -y systemctl
apt install -y vim