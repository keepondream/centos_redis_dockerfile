# 基于centos最新版来构建 nginx
FROM centos:latest
# 描述镜像作者信息
MAINTAINER dream
# 定义临时变量,只有在指定docker build . 构建容器时有效
# 定义基础工具
ARG bags='epel-release curl net-tools vim wget'
# 定义当前工作目录,类似 cd
WORKDIR /config
# 创建redis用户和用户组
RUN groupadd -r redis \
    && useradd -r -g redis redis \
    && chown -R redis:redis /config
# 第一层,更新YUM 并安装好所有的基础工具
RUN /bin/yum update -y \
    && yum install -y $bags \
    && yum install -y redis
# 复制文件,从构建上下文目录中的[源路劲]的文件或目录赋值到新的一层镜像中的[目标路劲]
COPY ./config/redis-master.conf /config
# 复制文件,比COPY高级一层,可以直接 ADD <一个压缩包地址> <目标路径>,即可以直接下载压缩包并解压到目标路劲
ADD ./config/redis-slave.conf /config
ADD ./config/redis-sentinel1.conf /config
ADD ./config/redis-sentinel2.conf /config
ADD ./config/redis-sentinel3.conf /config
# 定义容器运行中的匿名卷,即在运行时自动挂载为匿名卷.即共享容器中的该目录
VOLUME /config
# 暴露6379端口
EXPOSE 6379
