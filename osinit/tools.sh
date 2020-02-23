#!/bin/bash

helm_package_name="helm-v3.0.2-linux-amd64.tar.gz"
wget https://get.helm.sh/${helm_package_name}

kubectl_iexec_version="1.2.0"
kubectl_iexec_package_name="kubectl-iexec_${kubectl_iexec_version}_Linux_x86_64.tar.gz"
wget https://github.com/gabeduke/kubectl-iexec/releases/download/${kubectl_iexec_version}/${kubectl_iexec_package_name}

wget https://github.com/stedolan/jq/releases/latest/download/jq-linux64

mkdir -p  tools
cd tools
cp ../jq-linux64 jq
tar xvf ../${helm_package_name} linux-amd64/helm --strip-components 1
tar xvf ../${kubectl_iexec_package_name} kubectl-iexec
cd ../
