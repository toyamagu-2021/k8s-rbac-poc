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
# project-a:writer cannot get project-a:pod
assert "no" "kubectl auth can-i get pods --as=system:serviceaccount:project-a:writer -n project-a"
# project-a:writer can create project-a:pod
assert "yes" "kubectl auth can-i create pods --as=system:serviceaccount:project-a:writer -n project-a"
# project-a:writer can get project-b:pod
assert "yes" "kubectl auth can-i get pods --as=system:serviceaccount:project-a:writer -n project-b"
