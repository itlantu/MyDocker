path=/home/MyDocker
filedeb="code-server.deb"
file1="xaa"
file2="xab"
debUrl="https://gitee.com/itlantu/MyDocker/releases/download/4.7"

fileReplace(){
    rm -f $2
    cp $1 $2
}

sources(){
    # 源备份
    cp /etc/apt/sources.list /etc/apt/sources.list.pak
    # 换源
    
    fileReplace $path/sources.list /etc/apt/sources.list
}

# 通过apt下载一些软件
aptInstall(){
    apt update
    apt install -y curl
    apt install -y wget
    apt install -y git
    apt install -y vim
}

# 下载并安装code-server
DebInstall(){
    if [ ! -d $path/package ];then
        mkdir $path/package
    fi

    cd $path/package

    # 是否存在code-server.deb包
    if [ ! -f $filedeb ];then
        # 是否存在被切片的code-server.deb包
        if [ ! -f $file1 ];then
            wget -P . $debUrl/$file1
        fi

        if [ ! -f $file2 ];then
            wget -P . $debUrl/$file2
        fi

        cat $file1 $file2 > code-server.deb
    fi

    dpkg -i code-server.deb

    # 删除安装包切片文件
    rm -f xaa
    rm -f xab
}

#vscode初始化配置
CodeSeverInit(){
    mkdir /home/coder
    mkdir ~/.config/
    mkdir ~/.config/code-server
    fileReplace $path/script/config.yaml ~/.config/code-server/config.yaml
}

main(){
    sources
    aptInstall
    DebInstall
    CodeSeverInit
}

main

