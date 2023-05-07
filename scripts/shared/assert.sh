#!/bin/bash

assert() {
  got=$($2)
  want=$1
  if [[ $got != $want ]]; then
    echo "error on $2: expected $want but got $got"
    exit 1
  fi
}
