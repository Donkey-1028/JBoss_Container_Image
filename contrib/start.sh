#!/bin/bash
# -------------------------------------------------------------
#   KHAN [provisioning]              http://www.opennaru.com/
#   JBoss EAP 7.4.7
#
#   contact : service@opennaru.com
#   Copyright(C) 2015, opennaru.com, All Rights Reserved.
# -------------------------------------------------------------

DATE=`date +%Y%m%d%H%M%S`

source /app/wasadm/jboss/bin/launch/env.sh

function clean_shutdown() {
  local management_port="9990"
  if [ -n "${PORT_OFFSET}" ]; then
    management_port=$((9990 + PORT_OFFSET))
  fi
  if [ -z ${management_port} ]; then
    $JBOSS_HOME/bin/jboss-cli.sh -c "shutdown --timeout=60"
  else
    $JBOSS_HOME/bin/jboss-cli.sh --commands="connect remote+http://localhost:${management_port},shutdown --timeout=60"
  fi
  wait $!
}

function setupShutdownHook() {
  trap "clean_shutdown" TERM
  trap "clean_shutdown" INT
}

function setupStart() {
  setupShutdownHook
  if [ ! -d "$JBOSS_LOG_DIR/gclog" ];
  then
      mkdir -p $JBOSS_LOG_DIR/gclog
  fi  
  
  if [ ! -d "$JBOSS_LOG_DIR/heapdump" ];
  then
      mkdir -p $JBOSS_LOG_DIR/heapdump
  fi  

  $JBOSS_HOME/bin/standalone.sh -DSERVER=$SERVER_NAME -c $CONFIG_FILE &

  local pid=$!

  wait $pid 2>/dev/null
  wait $pid 2>/dev/null
  
}

setupStart
