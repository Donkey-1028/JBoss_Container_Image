#!/bin/bash
# -------------------------------------------------------------
#   KHAN [provisioning]              http://www.opennaru.com/
#   JBoss EAP 7.4.7
#
#   contact : service@opennaru.com
#   Copyright(C) 2015, opennaru.com, All Rights Reserved.
# -------------------------------------------------------------

DATE=`date +%Y%m%d_%H%M%S`

export TZ=Asia/Seoul
export LANG=ko_KR.utf8
umask 0007

##### LD_LIBRARY_PATH #####
#export LD_LIBRARY_PATH=/test/test:$LD_LIBRARY_PATH
#export JAVA_OPTS="$JAVA_OPTS -Djava.library.path=$LD_LIBRARY_PATH"

##### JBOSS Directory Setup #####
export JBOSS_HOME=/app/wasadm/jboss
export SERVER_NAME=$HOSTNAME
export JBOSS_LOG_DIR=/log/wasadm/jboss

if [ e$JBOSS_LOG_DIR = "e" ]
then
export JBOSS_LOG_DIR="$JBOSS_HOME/log"
fi

if [ e$JBOSS_LOG_DIR != "e" ]
then
export JBOSS_LOG_DIR="$JBOSS_LOG_DIR/$SERVER_NAME"
fi

##### Configration File #####
export CONFIG_FILE=standalone.xml
export NODE_NAME=$HOSTNAME
export JBOSS_USER=wasadm

# JVM Options : Server
export JAVA_OPTS="-server $JAVA_OPTS"

# JVM Options : Memory
export JAVA_OPTS=" $JAVA_OPTS -Xms2048m -Xmx2048m -Xss256k"
export JAVA_OPTS=" $JAVA_OPTS -XX:MaxMetaspaceSize=512m"

export JAVA_OPTS=" $JAVA_OPTS -XX:+PrintGCTimeStamps "
export JAVA_OPTS=" $JAVA_OPTS -XX:+PrintGCDetails "
export JAVA_OPTS=" $JAVA_OPTS -Xloggc:$JBOSS_LOG_DIR/gclog/gc_$DATE.log "
export JAVA_OPTS=" $JAVA_OPTS -XX:+UseParallelGC "
export JAVA_OPTS=" $JAVA_OPTS -XX:+UseParallelOldGC "
export JAVA_OPTS=" $JAVA_OPTS -XX:+HeapDumpOnOutOfMemoryError "
export JAVA_OPTS=" $JAVA_OPTS -XX:HeapDumpPath=$JBOSS_LOG_DIR/heapdump "
export JAVA_OPTS=" $JAVA_OPTS -Djava.net.preferIPv4Stack=true"
export JAVA_OPTS=" $JAVA_OPTS -Dorg.jboss.resolver.warning=true"
export JAVA_OPTS=" $JAVA_OPTS -Dsun.rmi.dgc.client.gcInterval=0x7FFFFFFFFFFFFFFE"
export JAVA_OPTS=" $JAVA_OPTS -Dsun.rmi.dgc.server.gcInterval=0x7FFFFFFFFFFFFFFE"
export JAVA_OPTS=" $JAVA_OPTS -Djava.awt.headless=true"
export JAVA_OPTS=" $JAVA_OPTS -Djboss.node.name=$NODE_NAME"
export JAVA_OPTS=" $JAVA_OPTS -Djboss.server.log.dir=$JBOSS_LOG_DIR"
export JAVA_OPTS=" $JAVA_OPTS -Dorg.jboss.as.logging.per-deployment=false "
export JAVA_OPTS=" $JAVA_OPTS -Dsun.util.logging.disableCallerCheck=true "
export JAVA_OPTS=" $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom "

export JAVA_OPTS=" $JAVA_OPTS -Djboss.http.port=17021"
export JAVA_OPTS=" $JAVA_OPTS -Djboss.bind.address=0.0.0.0"

# sample application
#export GROUP_ID="hklife"
#export CODE_ID="com"
#export APPLICATION_NAME="session"
#export CONTEXT_ROOT="ROOT"
#export APPLICATION_DEPLOY="true"

export JAVA_OPTS=" $JAVA_OPTS -Dfile.encoding=UTF-8"
