# 生成code-server配置文件
mkdir ~/.config/
mkdir ~/.config/code-server
touch ~/.config/code-server/config.yaml
\cp /home/MyDocker/config.yaml ~/.config/code-server/config.yaml
mkdir /home/coder

# 将code-server作为守护进程
cp /home/MyDocker/script/code-server.service /etc/systemd/system/
systemctl start code-server.service
