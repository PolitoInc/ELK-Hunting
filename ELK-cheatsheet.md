# Threat Hunting with ELK Cheatsheet

Notes, sample commands, and URLs for the ELK VM provided during the workshop.
Disclaimer: This is a work in progress.

## ELK VM

### Credentials
* Username: logstasher
* Password: logstasher (recommend changing with passwd)

### Start and Stop ELK Services
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


