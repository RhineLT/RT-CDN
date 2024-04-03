#!/bin/bash

# 检查是否提供了两个参数：文件夹路径和S3存储桶名称
if [ $# -ne 2 ]; then
    echo "Usage: $0 local_folder_path s3_bucket"
    exit 1
fi

# 检查本地路径是否存在且是文件夹
if [ ! -d "$1" ]; then
    echo "Error: Local path $1 is not a directory."
    exit 1
fi

# 检查S3桶是否为空，以避免意外覆盖
s3cmd ls s3://$2 > /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo "Warning: $2 bucket exists and may be overwritten. Continue?"
    read -p "Press y to continue or any other key to cancel: " confirm
    if [ "$confirm" != "y" ]; then
        echo "Cancelled by user."
        exit 1
    fi
fi

# 使用s3cmd的递归上传功能
s3cmd put "$1" s3://$2 --recursive

echo "Upload complete. The contents of $1 have been uploaded to $2."
