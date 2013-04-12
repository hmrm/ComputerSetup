#!/bin/bash
echo "Enter your name:"
read name
git config --global user.name $name
echo "Enter your email:"
read email
git config --global user.email $email
git config --global color.ui true
