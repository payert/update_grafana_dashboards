Update Grafana Dashboards

1. Update the dashboards on the Ambari node in /var/lib/ambari-server/resources/stacks/HDP/3.0/services/AMBARI_METRICS/package/files/grafana-dashboards/HDP directory. For instance: /var/lib/ambari-server/resources/stacks/HDP/3.0/services/AMBARI_METRICS/package/files/grafana-dashboards/HDP/grafana-druid-home.json
2. The updated dashboards needs to be distributed to the other hosts, especially to the Grafana host. This can be initiated by restarting Amabri Server. "ambari-server restart"
3. Check if the reqired changes are present in the dashboard json file present in the Agent cache of Grafana host. For instance in "/var/lib/ambari-agent/cache/stacks/HDP/3.0/services/AMBARI_METRICS/package/files/grafana-dashboards/HDP/grafana-druid-home.json". If the change is not found try to restart the agent "amabri-agent restart"
4. Edit the update_dashboard.sh script and set the changed dasboards as "DASHBOARDS", the "GRAFANA_HOST" along with the other variables.
5. Run the script and check the changed dashboards in Grafana. 