#!/bin/sh

# Load header
. ./header.inc

# Port to Listen on
export MB_JETTY_PORT=${PORT}

# Database Conection Info
export MB_DB_TYPE=postgres
export MB_DB_DBNAME=$(bin/json_env PLATFORM_RELATIONSHIPS metabasedb.metabasedb.path)
export MB_DB_PORT=$(bin/json_env PLATFORM_RELATIONSHIPS metabasedb.metabasedb.port)
export MB_DB_USER=$(bin/json_env PLATFORM_RELATIONSHIPS metabasedb.metabasedb.username)
export MB_DB_PASS=$(bin/json_env PLATFORM_RELATIONSHIPS metabasedb.metabasedb.password)
export MB_DB_HOST=$(bin/json_env PLATFORM_RELATIONSHIPS metabasedb.metabasedb.host)

# Grab memory limits
export MEM_AVAILABLE=$(bin/jq .info.limits.memory /run/config.json)

# Limit Heapsize
export JAVA_TOOL_OPTIONS="-XX:+CMSClassUnloadingEnabled -XX:+UseConcMarkSweepGC -XX:MaxPermSize=${MEM_AVAILABLE}m -Xmx${MEM_AVAILABLE}m"

#java -jar ${METABASE_HOME}/${METABASE_JAR} migrate release-locks
java -jar ${METABASE_HOME}/${METABASE_JAR}

