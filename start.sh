#!/bin/sh

# Port to Listen on
export MB_JETTY_PORT=${PORT}

# Database Conection Info
export MB_DB_TYPE=postgres
export MB_DB_DBNAME=$(bin/json_env PLATFORM_RELATIONSHIPS metabasedb.metabasedb.path)
export MB_DB_PORT=$(bin/json_env PLATFORM_RELATIONSHIPS metabasedb.metabasedb.port)
export MB_DB_USER=$(bin/json_env PLATFORM_RELATIONSHIPS metabasedb.metabasedb.username)
export MB_DB_PASS=$(bin/json_env PLATFORM_RELATIONSHIPS metabasedb.metabasedb.password)
export MB_DB_HOST=$(bin/json_env PLATFORM_RELATIONSHIPS metabasedb.metabasedb.host)

# Limit Heapsize
export JAVA_TOOL_OPTIONS="-Xmx768m -Xss1024k"

#java -jar bin/metabase.jar migrate release-locks
java -jar bin/metabase.jar
