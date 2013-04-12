#!/bin/bash
echo "Enter your name:"
read -e name
git config --global --replace-all user.name "$name"
echo "Enter your email:"
read -e email
git config --global --replace-all user.email $email
git config --global color.ui true
