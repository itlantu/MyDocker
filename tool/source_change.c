#include <stdio.h>

#define SourcesFilePath "/etc/apt/sources.list"
#define len 10

const char *sources[len] = {
    "deb http://mirrors.aliyun.com/ubuntu/ focal main restricted universe multiverse",
    "deb-src http://mirrors.aliyun.com/ubuntu/ focal main restricted universe multiverse",

    "deb http://mirrors.aliyun.com/ubuntu/ focal-security main restricted universe multiverse"
    "deb-src http://mirrors.aliyun.com/ubuntu/ focal-security main restricted universe multiverse"

    "deb http://mirrors.aliyun.com/ubuntu/ focal-updates main restricted universe multiverse"
    "deb-src http://mirrors.aliyun.com/ubuntu/ focal-updates main restricted universe multiverse"

    "# deb http://mirrors.aliyun.com/ubuntu/ focal-proposed main restricted universe multiverse"
    "# deb-src http://mirrors.aliyun.com/ubuntu/ focal-proposed main restricted universe multiverse"

    "deb http://mirrors.aliyun.com/ubuntu/ focal-backports main restricted universe multiverse"
    "deb-src http://mirrors.aliyun.com/ubuntu/ focal-backports main restricted universe multiverse"

};

int main()
{
    FILE *sourcesFile = fopen("SourcesFilePath", "r");
    fclose(sourcesFile);
    for(int i = 0; i < len; i++){
        if(fputs(sources[i],sourcesFile) == EOF){
            printf("fputs Error \n");
            return 1;
        }
        if(fputc((int)'\n',sourcesFile) == EOF){
            printf("fputc Error \n");
            return 2;
        }
    }
    return 0;
}