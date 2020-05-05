#!/bin/bash
#set -x

DASHBOARDS="grafana-druid-home.json grafana-hbase-home.json grafana-hdfs-namenodes.json"

DASHBOARDS_HOME=/var/lib/ambari-agent/cache/stacks/HDP/3.0/services/AMBARI_METRICS/package/files/grafana-dashboards/HDP
GRAFANA_HOST=c7401.ambari.apache.org
GRAFANA_PORT=3000
USERID=admin
PASSWORD=admin

for dashboard in ${DASHBOARDS}; do
    printf "\nAttempting to update dashboard [${dashboard}].\n"
    echo '{"dashboard": '$(cat ${DASHBOARDS_HOME}/${dashboard})', "overwrite": true }' | \
        curl -H "Content-Type: application/json" --data-binary @- "http://${USERID}:${PASSWORD}@${GRAFANA_HOST}:${GRAFANA_PORT}/api/dashboards/db"
    printf "\n"
done