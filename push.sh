#!/bin/bash

echo 1
podman tag localhost/rhel8-jdk8-jboss7:7.4.7 default-route-openshift-image-registry.apps.buahn.ocp.com/openshift/rhel8-jdk8-jboss7:7.4.7
podman tag localhost/rhel8-jdk8-jboss7:7.4.7 default-route-openshift-image-registry.apps.buahn.ocp.com/hklife/rhel8-jdk8-jboss7:7.4.7

echo 2
#podman login -u '$(oc whoami)' -p $(oc whoami -t) default-route-openshift-image-registry.apps.buahn.ocp.com --tls-verify=false

echo 3
podman push default-route-openshift-image-registry.apps.buahn.ocp.com/openshift/rhel8-jdk8-jboss7:7.4.7
podman push default-route-openshift-image-registry.apps.buahn.ocp.com/hklife/rhel8-jdk8-jboss7:7.4.7

echo 4
#oc rollout latest dc/rhel8-jdk8-jboss7
