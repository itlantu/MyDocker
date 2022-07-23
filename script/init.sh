# 生成code-server配置文件
touch ~/.config/code-server/config.yaml
/cp /home/MyDocker/config.yaml ~/.config/code-server/config.yaml
mkdir /home/coder

# 将code-server作为守护进程
systemctl enable code-server@root.service

apt install vim