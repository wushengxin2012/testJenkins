#!/bin/bash
# -- 构建镜像并推送私有仓库 --
set -eu #如有报错或取不到变量情况停止执行

#声名常量
#IMG_REGISTRY="192.168.87.129:5000" #镜像仓库
IMG_REGISTRY="192.168.0.104:5000"
IMG_NAME="demo"
IMG_TAG=`date "+%Y%M%d_%H%M"`      #镜像标签，如 20201223_1351
IMG_FULL_NAME="${IMG_REGISTRY}/${IMG_NAME}:${IMG_TAG}" #镜像上传与拉取的名称

#构建镜像 -- 由外部的kaniko构建
docker -H  192.168.0.104:2375 build -t ${IMG_FULL_NAME} .

#推送镜像
docker -H  192.168.0.104:2375 push ${IMG_FULL_NAME}

#加载到minikube中
#minikube image load ${IMG_FULL_NAME}

#删除本地镜像
#docker rmi ${IMG_FULL_NAME}

#修改deploy.yaml的镜像标签
sed -i "s#{{IMAGE_NAME}}#${IMG_FULL_NAME}#g" deploy.yaml