#!/bin/bash
# -- 部署image到k8s --
# !注意：需要提前做ssh免密登录
set -eu

#定义常量
#PROJECT_NAME="cicd-demo"
#UPLOAD_DIR="/home/hellxz/apps/${PROJECT_NAME}"
#UPLOAD_DIR="./${PROJECT_NAME}"
#FILE_NAME="${UPLOAD_DIR}/deploy.yaml"
FILE_NAME="deploy.yaml"
#SSH_USER="hellxz"
#SSH_IP="192.168.87.129"

#首先删除待上传目录的同名文件
#ssh ${SSH_USER}@${SSH_IP} "rm -rf ${FILE_NAME}"

#确保部署文件目录存在
#ssh ${SSH_USER}@${SSH_IP} "mkdir -p ${UPLOAD_DIR}"

#远程复制部署文件
#scp -r deploy.yaml ${SSH_USER}@${SSH_IP}:${FILE_NAME}

#远程执行部署命令
#ssh ${SSH_USER}@${SSH_IP} "kubectl apply -f ${FILE_NAME}"
jenkinsAdminToken="eyJhbGciOiJSUzI1NiIsImtpZCI6ImxGci1JUjFUamVIX1ZJbkk4dGY3OVBDUkszZjF0VFV0TGpqRkUyeUtNencifQ.eyJpc3MiOiJrdWJlcm5ldGVzL3NlcnZpY2VhY2NvdW50Iiwia3ViZXJuZXRlcy5pby9zZXJ2aWNlYWNjb3VudC9uYW1lc3BhY2UiOiJkZWZhdWx0Iiwia3ViZXJuZXRlcy5pby9zZXJ2aWNlYWNjb3VudC9zZWNyZXQubmFtZSI6ImplbmtpbnMtYWRtaW4tdG9rZW4tNzdncjYiLCJrdWJlcm5ldGVzLmlvL3NlcnZpY2VhY2NvdW50L3NlcnZpY2UtYWNjb3VudC5uYW1lIjoiamVua2lucy1hZG1pbiIsImt1YmVybmV0ZXMuaW8vc2VydmljZWFjY291bnQvc2VydmljZS1hY2NvdW50LnVpZCI6IjZhMzMyODNkLWM2YzItNGVhMC1hZDAyLTY5NDZjZjAwOGRjZCIsInN1YiI6InN5c3RlbTpzZXJ2aWNlYWNjb3VudDpkZWZhdWx0OmplbmtpbnMtYWRtaW4ifQ.GJh8ARXMvtB6VlwuoAc9QNcbUxiCoPtREHMfkzDdmIKZjMRaAX6rrDJjlYA3pwDqmy0-cmIGmfgsngp8VYQzJOqeyCLzSfo-m-LxFdfzWLgE1Ml_oWckQTHGBxoGivOqoIQghf5oytRdSl3swGMI0Ic9TJO7xc4_xz1CCALo6DKzNbxAvnyD4ZORCgy19aBbCPbHurCxctwmCWDcRUPhmyDMeyVR9SKRi5z9Dyszk3jz97Ru0XJpp9Uk2tpFNRzOpowCzc39YCo5WMtXfHRpKvAj0wvE5Ny3PeaRlwmAkkHRq-1IUUhukin8iwrm7zmXHxbuy_3on24EPWnqbo-qDA"
kubectl apply -f ${FILE_NAME} --token $jenkinsAdminToken