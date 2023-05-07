#!/bin/bash

source ../scripts/shared/assert.sh

# project-a:reader can get project-a:pod
assert "yes" "kubectl auth can-i get pods --as=system:serviceaccount:project-a:reader -n project-a"
# project-a:reader cannot get project-b:pod
assert "no" "kubectl auth can-i get pods --as=system:serviceaccount:project-a:reader -n project-b"
# project-b:reader can get project-a:pod
assert "yes" "kubectl auth can-i get pods --as=system:serviceaccount:project-b:reader -n project-a"
# project-b:reader can get project-b:pod
assert "yes" "kubectl auth can-i get pods --as=system:serviceaccount:project-b:reader -n project-b"
