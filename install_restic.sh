#!/bin/bash
git clone https://github.com/restic/restic
cd restic
go run build.go
cp ./restic /usr/bin
restic version