# 生成code-server配置文件
mkdir ~/.config/
mkdir ~/.config/code-server
touch ~/.config/code-server/config.yaml
\cp /home/MyDocker/config.yaml ~/.config/code-server/config.yaml
mkdir /home/coder

# 将code-server作为守护进程
cp /home/MyDocker/script/code-server.service /etc/systemd/system/
systemctl start code-server.service

# 将code-server设置为开机启动
# touch /etc/profile.d/code-server.open.sh
# cp /home/MyDocker/script/code-server.open.sh /etc/profile.d/
