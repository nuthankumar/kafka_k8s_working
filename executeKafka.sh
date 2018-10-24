#!/bin/bash

current_dir=$(pwd)
echo "current_dir is $current_dir"
parentdir="$(dirname "$current_dir")"
echo $parentdir
kubectl create -f $parentdir/kafka_kubernetes_zookeeper/0namespace.yml
sleep 5s
kubectl create -f $parentdir/kafka_kubernetes_zookeeper/1zookeeper.yml
sleep 5s
kubectl create -f $parentdir/kafka_kubernetes_zookeeper/2kafka.yml
sleep 5s
kubectl create -f $parentdir/kafka_kubernetes_zookeeper/producer.yaml
sleep 5s
kubectl create -f $parentdir/kafka_kubernetes_zookeeper/consumer.yaml
kubectl config set-context $(kubectl config current-context) --namespace=nuthan
