#!/bin/bash
echo $0
gitbook build
git add .
git commit -m $0
git push origin master
