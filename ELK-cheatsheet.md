# Threat Hunting with ELK Cheatsheet

Notes, sample commands, and URLs for the ELK VM provided during the workshop.
Disclaimer: This is a work in progress.

## ELK VM

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

### Delete Index (Example)
Warning: please use extreme caution when deleting Elasticsearch indices.

This command deletes all Filebeat indices from Elasticsearch. You can specify a particular index to delete or use a wildcard.
```
curl -XDELETE http://localhost:9200/filebeat-*

```
