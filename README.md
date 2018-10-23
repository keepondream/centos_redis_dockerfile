#### centos_redis_dockerfile
### 基于centos构建的redis镜像

快速构建一主多从
```
 1. 在任意目录 git clone https://github.com/keepondream/centos_redis_dockerfile.git
 2. 进入 centos_redis_dockerfile目录
 3. 使用docker-compose 命令 运行 一主 3从
        docker-compose up -d --scale slave=2
        slave 是yaml文件中的 从
 2 代表 执行2个从节点  理论上 你的服务器够厉害,可以运行 N个从节点
 4. 使用 docker-compose down 停止并删除容器
 5. 使用 docker ps 查看运行容器
 6. 使用 docker exec -it <容器名称> bash 进入容器,之后在主节点中设置 key 看看其余从节点 是否同步
```

#### docker安装 https://blog.df5g.com/article/25