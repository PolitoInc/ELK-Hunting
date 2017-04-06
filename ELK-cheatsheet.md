# Threat Hunting with ELK Cheatsheet

Notes, sample commands, and URLs for the ELK VM provided during the workshop. Many of the basic commands will work in other ELK clusters including Elastic Cloud, edit them as needed. Disclaimer: This is a work in progress.

## ELK VM

### Introduction
This ELK VM is a self-contained, single-node ELK cluster exported as an OVA from VirtualBox. It can be imported into VirtualBox or VMware Workstation/Fusion. Elasticsearch, Logstash, Filebeat, and Kibana have been installed. Filebeat 5.3's new Apache2 module was used to ship sample Apache2 logs from a web server (hosting a Drupal site) to Elasticsearch. This includes a prebuilt Apache2 Dashboard and utilizes the geoip and user-agent Elasticsearch plugins. Manually search the logs, use the Apache2 Dashboard, and build your own visualizations and dashboards to identify potentially malicious events in the Apache2 logs.

### RAM
Default for the VM is 2 GB, but increase this if your host system has more RAM to spare. It needs as much RAM as possible.

### Credentials
* Username: logstasher
* Password: logstasher (recommend changing with passwd)

### Start and Stop ELK Services
Recent versions of Ubuntu and Debian use systemd and systemctl command to start and stop services. The DEB install configures the services to automatically start (not 100% reliable), and you can start and stop them manually with the following commands. If you make any signficiant config changes, you will need to restart the relevant Elastic component(s).
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

### Kibana
* Default port: 5601
* Access Kibana in web browser (Chrome recommended): http://localhost:5601
* View Kibana status: http://localhost:5601/status

* Discover tab - search your logs
* Visualize tab - build and load Visualizations of your logs
* Dashboard - build and load Dashboards made out of Visualizations
* Management - configure index patterns; if X-Pack is installed, configure users and roles

## Elasticsearch Commands
Edit the commands, hostnames, ports, etc. as needed based on your ELK environment. If X-Pack is installed and configured, you may need to provide credentials to run the command / access the URL.

* Elasticsearch default port: 9200

### Check If Elasticsearch Is Running:
http://localhost:9200/

### Display a List of Elasticsearch Indices
http://localhost:9200/_cat/indices?pretty

### Delete Index (Example)
Warning: please use extreme caution when deleting Elasticsearch indices.

This command deletes all Filebeat indices from Elasticsearch. You can specify a particular index to delete or use a wildcard.
```
curl -XDELETE http://localhost:9200/filebeat-*
```

## Additional ELK Documentation

### Official Elastic Stack Docs
* https://www.elastic.co/guide/index.html

### ELK Cheat Sheets
* Kibana and ElasticSearch Cheat Sheet v1.0 by @cyb3rops and @blubbfiction: https://drive.google.com/file/d/0B2S_IOa0MiOHWndxWFRiUHNoNW8/view
* A Useful Elasticsearch Cheat Sheet in Times of Trouble: https://logz.io/blog/elasticsearch-cheat-sheet/

## Elastic Cloud
* Free 14-day trial: https://www.elastic.co/cloud/as-a-service
* Pricing: https://www.elastic.co/cloud/as-a-service/pricing

## Threat Hunting with Logs

### Threat Hunting with ELK

### Threat Hunting with Sysmon
* Mark Russinovich - How to Go from Responding to Hunting with Sysinternals Sysmon (RSA): https://www.rsaconference.com/events/us17/agenda/sessions/7516-How-to-Go-from-Responding-to-Hunting-with-Sysinternals-Sysmon
* https://cyberwardog.blogspot.com/2017/04/chronicles-of-threat-hunter-hunting-for.html

### Log Cheatsheets
* Malware Archaeology has excellent cheaatsheets for Windows logging, Splunk, Windows log auditing, and PowerShell logging: https://www.malwarearchaeology.com/cheat-sheets


