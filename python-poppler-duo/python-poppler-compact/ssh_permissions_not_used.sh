#!/usr/bin/env bash

echo 'root:Admin123' | chpasswd
sed -i 's/#*PermitRootLogin prohibit-password/PermitRootLogin yes/g' /etc/ssh/sshd_config

