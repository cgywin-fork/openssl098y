#!/usr/bin/env bash

make clean

./config --prefix=/usr/local/openssl98y --openssldir=/usr/local/openssl98y > c.log 2>&1
make > m.log 2>&1
make install > i.log 2>&1