# Threat Hunting with ELK Cheatsheet

Notes, sample commands, and URLs for the ELK VM provided during the workshop. Many of the basic commands will work in other ELK clusters including Elastic Cloud, edit them as needed. Disclaimer: This is a work in progress.

## ELK VM
Filebeat 5.3's new Apache2 module was used to ship sample Apache2 logs from a web server (hosting a Drupal site) to Elasticsearch. This includes a prebuilt Apache2 Dashboard and utilizes the geoip and user-agent Elasticsearch plugins. Manually search the logs, use the Apache2 Dashboard, and build your own visualizations and dashboards to identify potentially malicious events in the Apache2 logs.

### Credentials
* Username: logstasher
* Password: logstasher (recommend changing with passwd)

### Start and Stop ELK Services
Recent versions of Ubuntu and Debian use systemd and systemctl command to start and stop services. The DEB install configures the services, and you can start and stop them individuall with the following commands:
```
sudo systemctl start elasticsearch.service
sudo systemctl start logstash.service
sudo systemctl start filebeat.service
sudo systemctl start kibana.service

sudo systemctl stop elasticsearch.service
sudo systemctl stop logstash.service
sudo systemctl stop filebeat.service
sudo systemctl stop kibana.service

```

## ELK Commands

Edit the commands, hostnames, ports, etc. as needed based on your ELK environment. 

### Display a List of Elasticsearch Indices
/_cat/indices?pretty

### Delete Index (Example)
Warning: please use extreme caution when deleting Elasticsearch indices.

This command deletes all Filebeat indices from Elasticsearch. You can specify a particular index to delete or use a wildcard.
```
curl -XDELETE http://localhost:9200/filebeat-*

```
