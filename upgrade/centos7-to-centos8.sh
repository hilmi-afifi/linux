#!/bin/bash

#sudo more /etc/redhat-release;
yum update –y;
yum install epel-release;
yum install yum-utils -y;
yum install rpmconf -y;
rpmconf –a;
package-cleanup --leaves;
package-cleanup --orphans;
yum install dnf -y;
dnf –y remove yum yum-metadata-parser;
rm -rf /etc/yum;
dnf upgrade -y;
dnf install -y http://vault.centos.org/8.5.2111/BaseOS/x86_64/os/Packages/{centos-linux-repos-8-3.el8.noarch.rpm,centos-linux-release-8.5-1.2111.el8.noarch.rpm,centos-gpg-keys-8-3.el8.noarch.rpm};
dnf -y upgrade https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm;
dnf clean all;
rpm -e `rpm -q kernel`;
rpm -e --nodeps sysvinit-tools;
dnf -y --releasever=8 --allowerasing --setopt=deltarpm=false distro-sync;
dnf -y install kernel-core;
dnf -y groupupdate "Core" "Minimal Install";
cat /etc/redhat-release;
