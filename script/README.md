
# 脚本介绍

scirpt文件夹中包含了一些脚本和配置文件

文件名|作用
--|--
README.md|描述文件
main.sh|主脚本，负责apt换源，从gitee下载并合成code-server安装包，替换code-server配置文件，通过apt下载软件
config.yaml|code-server的配置文件，会被main.sh替换到指定位置
split.sh|用于将code-server安装包切割成两个更小的文件，以避免上传gitee时单个文件过大，这个脚本不会在构建镜像时被使用
