#!/bin/bash -v
echo -n "Input commit message: "
read input
git commit -s -m "$input"
git push
