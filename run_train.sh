#!/bin/bash

ret=`source ~/pytorch-benchmarks/scripts/get_cluster_info.sh`
ret_arr=($ret)
storage=${ret_arr[0]}
master=${ret_arr[1]}
#echo 'Master:' $master
echo 'Storage:' $storage

pretrained_weights=${storage}'/pytorch_yolo/pretrained_weights/darknet53.conv.74'
dataset_dir=${storage}'/coco'

CUDA_VISIBLE_DEVICES='0' python train.py \
  --weights $pretrained_weights \
  --batch-size 16 \
  --cfg yolov3.cfg \
  --data-config data/coco2014.data \
  $dataset_dir
