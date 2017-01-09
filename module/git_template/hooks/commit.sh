#!/bin/bash
git status
echo -n "Input commit message: "
echo -n -e '\e[0;33m'
read input
echo -n -e '\e[0m'
git commit -s -m "$input"
