# yum-download-rpm
[Tools]yum源下载,并生成依赖关系


## 1. 安装docker环境(centos 7)

```
sudo yum install -y yum-utils \
  device-mapper-persistent-data \
  lvm2

sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo

sudo yum install docker-ce

sudo systemctl enable docker && sudo systemctl start docker
```

## 2. 构建镜像

```
docker build  -t yum-downloader-rpm .

```

## 3. 下载rpm包

```
docker run -v $PWD/rpms:/rpms/ yum-downloader-rpm git curl ansible
```

## 4. 生成yum仓库

```
sudo yum install -y createrepo 

sudo createrepo --update $PWD/rpms
```