#!/bin/bash

#podman run -u wasadm -e HOSTNAME=hgtest --name jboss-test -it jboss-test:latest /bin/bash
#podman run -u wasadm -e HOSTNAME=hgtest --name jboss-test -it jboss-test:latest
podman run --cpus=2.0 -u wasadm -p 8989:17021 -e CONNECTION_URL="jdbc:oracle:thin:@192.168.23.29:1521:XE" -e HOSTNAME=hgtest -e PORT=8081 --name jboss-test -it rhel8-jdk8-jboss7:7.4.7

