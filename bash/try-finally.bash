#!/usr/bin/env bash

# Bash doesn't have a native try..finally construct, which
# helps to cleanup irrespective of failure or success.


# One can use the `trap` function to achieve the same. However
# the trap is global in scope and will execute at the end of a program.
finally() {
   popd
   rmdir exampledir
}

echo "Globally scoped try..finally"
mkdir -p exampledir
trap finally EXIT
pushd exampledir
sleep 3

# To enable scoped cleanup we can spawn a sub shell
echo "Locally scoped try..finally"
(
  mkdir -p exampledir
  trap finally EXIT
  pushd exampledir
  sleep 3
)

ls -lS
