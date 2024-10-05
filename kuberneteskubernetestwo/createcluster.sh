#!/bin/bash

eksctl create cluster \
  --name my-cluster \
  --version 1.26 \
  --region ap-south-1 \
  --nodegroup-name standard-workers \
  --node-type t3.micro \
  --nodes 2 \
  --nodes-min 1 \
  --nodes-max 3 \
  --managed
