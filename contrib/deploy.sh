#!/bin/bash

echo "deploy /src/wasadm/${GROUP_ID}/${CODE_ID}/${APPLICATION_NAME}.war --name=${APPLICATION_NAME} --runtime-name=${CONTEXT_ROOT}.war
:reload(admin-only=false)" >> /app/wasadm/jboss/bin/launch/deploy-script.sh
