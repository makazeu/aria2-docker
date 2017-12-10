# Aria2-Docker
## 简介
这是一个在Linux x64系统上自动部署Aria2+YAAW+FileManager(Caddy)的镜像。

* [Aria2](https://github.com/aria2/aria2)是一个支持多种协议的下载工具
* [YAAW](https://github.com/binux/yaaw)是纯HTML/CSS/JS编写的Aria2前端
* [FileMAnager](https://github.com/hacdias/filemanager)是个可以在线管理文件的Caddy插件

## 使用
1. 在Linux x64系统上[安装Docker](https://docs.docker.com/engine/installation/linux/docker-ce/ubuntu/)
2. 拉取本项目仓库
> `git clone https://github.com/zyfworks/aria2-docker.git`
3. 构建镜像
> `cd aria2-docker && docker build -t aria2 .`
4. 启动容器
> `docker run -d --name aria2 -e username=admin -e password=admin123 -e rpc=rpc -p 80:8080 -p 6800:6800 -v /downloads:/download aria2`
5. 浏览器打开`http://[服务器域名或IP]`，在YAAW的设置里把`JSON-RPC Path`改为`http://token:授权令牌@服务器域名或IP:6800/jsonrpc`即可使用YAAW管理Aria2
6. 浏览器打开`http://[服务器域名或IP]/download`即可查看、管理下载的文件

## 参数释义
* `--name aria2`: 容器的名字，可省略
* `-e username=admin`: Web访问的用户名，省略则使用默认值admin
* `-e password=admin123`: Web访问的密码，省略则使用默认值admin123
* `-e rpc=rpc`: Aria2的授权令牌，省略则使用默认值rpc
* `-p 80:8080`: 把主机80端口映射到容器8080端口供Web访问
* `-p 6800:6800`: 把主机6800端口映射到容器6800端口供RPC调用
* `-v /downloads:/download`: 把主机`/downloads`目录挂载到容器`/download`目录用来存在下载的文件
