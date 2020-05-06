#!/bin/bash
#set -x

DASHBOARDS="grafana-druid-home.json grafana-hbase-home.json grafana-hdfs-namenodes.json"
SECURE_CLUSTER=false
DASHBOARDS_HOME=/var/lib/ambari-agent/cache/stacks/HDP/3.0/services/AMBARI_METRICS/package/files/grafana-dashboards/HDP
GRAFANA_HOST=c7401.ambari.apache.org
GRAFANA_PORT=3000
USERID=admin
PASSWORD=admin

for dashboard in ${DASHBOARDS}; do
    printf "\nAttempting to update dashboard [${dashboard}].\n"

    if [ "${SECURE_CLUSTER}" = true ]; then
        echo '{"dashboard": '$(cat ${DASHBOARDS_HOME}/${dashboard})', "overwrite": true }' | \
            curl --insecure -L --negotiate -u "${USERID}:${PASSWORD}" -H "Content-Type: application/json" --data-binary @- "https://${GRAFANA_HOST}:${GRAFANA_PORT}/api/dashboards/db"
    else
        echo '{"dashboard": '$(cat ${DASHBOARDS_HOME}/${dashboard})', "overwrite": true }' | \
            curl -H "Content-Type: application/json" --data-binary @- "http://${USERID}:${PASSWORD}@${GRAFANA_HOST}:${GRAFANA_PORT}/api/dashboards/db"
    fi

    printf "\n"
done