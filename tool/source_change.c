#include <stdio.h>
#include <stdlib.h>

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
    FILE *sourcesFile;
    int length = 0;
    int lenlist[len];
    int count = 0;

    for(int i = 0; i < len - 1; i++){
        lenlist[i] = strlen(sources[i]) - 1;
        length += lenlist[i];
    }
    char *s = (char*)malloc(sizeof(char) * length);

    for(int i = 0; i < len -1 ;i++){
        int v = lenlist[i];
        for(int j = 0; j < v; j++,count++){
            s[count] = sources[i][j];
        }
    }
    s[length - 1] = '\0';

    if((sourcesFile = fopen("SourcesFilePath", "r")) == NULL){
        printf("fopen Error \n");
        return 1;
    }

    if((fputs(s,sourcesFile)) == NULL){
        printf("fputs Error \n");
        return 2;
    }
    
    free(s);
    fclose(sourcesFile);
    return 0;
}