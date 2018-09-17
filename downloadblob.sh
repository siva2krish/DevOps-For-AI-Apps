#!/bin/bash

#This file is to download pretrained model file and associate synset.txt file. It is assumed that these two files are already in a blob
#container, if you want to use a pretrained image classification model and associated synset file, you can download them from the links below
# and put them in storage container
# wget http://data.dmlc.ml/mxnet/models/imagenet/synset.txt
# wget https://www.cntk.ai/resnet/ResNet_152.model

# Downloading Azure CLI on the VSTS build agent machine
apt-get update -y && apt-get install -y python libssl-dev libffi-dev python-dev build-essential
curl -L https://azurecliprod.blob.core.windows.net/install.py -o install.py
printf "/usr/azure-cli\n/usr/bin" | python install.py
az

#Setting environment variables to access the blob container
export AZURE_STORAGE_ACCOUNT=amlstrgnew
export AZURE_STORAGE_KEY=bblmi2HwD+ymk3QuBSa21cwe1D4HaV5CGQNo/KMgDeNdQT/zlvIF08EQM6+5yU2jLe27Htaxt6hfx54cKTd3bw==
export container_name=https://amlstrgnew.blob.core.windows.net/devops
export blob_name1=https://amlstrgnew.blob.core.windows.net/devops/ResNet_152.model
export blob_name2=https://amlstrgnew.blob.core.windows.net/devops/synset.txt

# Downloading Blob
mkdir flaskwebapp
az storage blob download --container-name $container_name --name $blob_name1 --file flaskwebapp/$blob_name1 --output table
az storage blob download --container-name $container_name --name $blob_name2 --file flaskwebapp/$blob_name2 --output table
az storage blob list --container-name $container_name --output table
