#!/bin/bash
echo $0
echo $1
gitbook build
git add .
git commit -m "$1"
git push origin master
