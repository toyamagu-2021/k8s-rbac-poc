#!/bin/bash

source ../scripts/shared/assert.sh

# project-a:reader can get project-a:pod
assert "yes" "kubectl auth can-i get pods --as=system:serviceaccount:project-a:reader -n project-a"
# project-a:writer can get project-a:pod
assert "yes" "kubectl auth can-i get pods --as=system:serviceaccount:project-a:writer -n project-a"
# project-a:writer can create project-a:pod
assert "yes" "kubectl auth can-i create pods --as=system:serviceaccount:project-a:writer -n project-a"
# project-a:writer can get project-b:pod
assert "yes" "kubectl auth can-i get pods --as=system:serviceaccount:project-a:writer -n project-b"
# project-a:reader cannot get project-b:pod
assert "no" "kubectl auth can-i get pods --as=system:serviceaccount:project-a:reader -n project-b"
