#!/bin/bash

assert() {
  got=$($2)
  want=$1
  if [[ $got != $want ]]; then
    echo "expected $want but got $got"
    exit 1
  fi
}

# project-a:reader can get project-a:pod
assert "yes" "kubectl auth can-i get pods --as=system:serviceaccount:project-a:reader -n project-a"
# project-a:reader cannot get project-b:pod
assert "no" "kubectl auth can-i get pods --as=system:serviceaccount:project-a:reader -n project-b"
