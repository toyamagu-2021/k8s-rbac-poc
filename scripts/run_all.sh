#!/bin/bash

dirs=$(ls -d */ | grep -v "scripts")

echo "directories: $dirs"

kind create cluster 
for d in $dirs; do
  echo ""
  echo "directory: $d start"
  cd $d
  kubectl apply -f . > /dev/null
  bash scripts/test.sh
  kubectl delete -f . > /dev/null
  cd ..
  echo "directory: $d end"
  echo ""
done
kind delete cluster
