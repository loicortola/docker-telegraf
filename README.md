# docker-telegraf
A simple and easy-to-use Telegraf docker container.

## Default configuration template
The default configuration template (telegraf.conf.template) has been set with the following settings:  
```
flush_interval = 10s  
flush_jitter = 5s  
```
Following parameters can be overridden (see Configuration section):  
```
node = "node"  
interval = 1s  

[[outputs.influxdb]]  
  urls = ["http://localhost:8086"]  
  database = "metrics"
  precision = "s"  
  user = "root"  
  password = "root"
```


## Procedure
Simply run this command on your host:

```sh
docker run -t loicortola/telegraf
```

## Configuration
Multiple environment variables can be set to better configure your Telegraf container.  
 * NODE_NAME : a global tag for your node. Tag will be called "node" (default value: "node")
 * INTERVAL : set the default interval to perform data collection. (default value: 1s)
 * HOST : change the target InfluxDB host (default: "localhost")
 * PORT : change the default InfluxDB HTTP API port (default: "8086")
 * DB : change the InfluxDB name where data will be sent (default: "metrics")
 * USERNAME : provide username for the target InfluxDB (default: "root")
 * PASSWORD : provide password for the target InfluxDB (default: "root")
 
Examples:  
```sh
docker run -t -e "HOST=influx.loicortola.com" -e "USER=metrics" -e "PASSWORD=1234password" loicortola/telegraf  
docker run -t -e "NODE_NAME=local" -e "DB=localmetrics" -e "INTERVAL=10s" -e "PORT=8111" loicortola/telegraf
```
>>>>>>> Added codebase
