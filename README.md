# Zabbix
Cluster com microk8s


```
git clone https://github.com/madson7/Zabbix.git
cd Zabbix/
```

sudo microk8s.enable dns

## Configs Zabbix e Mysql
```
sudo microk8s kubectl apply -f ./Configs/
```

## Path
```
sudo mkdir -p /zbx_env/usr/lib/zabbix/alertscripts \
  /zbx_env/usr/lib/zabbix/externalscripts \
  /zbx_env/var/lib/zabbix/modules \
  /zbx_env/var/lib/zabbix/enc \
  /zbx_env/var/lib/zabbix/snmptraps \
  /zbx_env/var/lib/zabbix/mibs \
  /zbx_env/var/lib/zabbix/export

sudo mkdir /MYSQL

sudo mkdir /grafana
```
<!-- 
## Volumes
```
sudo microk8s kubectl apply -f ./Volumes/
``` -->

## Replication Zabbix e Mysql
```
sudo microk8s kubectl apply -f ./Replication/
sudo microk8s kubectl apply -f ./Services/
```

## Grafana
```
sudo microk8s kubectl apply -f ./grafana/
```

http://<IP-Zabbix-Web>:<Port>/api_jsonrpc.php

## CMD
```
sudo microk8s kubectl exec zabbix-server-k7fvz -n zabbix -- ls /usr/lib/zabbix/externalscripts/
```


## Agent windows
```
https://www.zabbix.com/download_agents
C:\zabbix\bin\zabbix_agent2.exe -c C:\zabbix\conf\zabbix_agent2.conf -i
netsh advfirewall firewall add rule name="ICMP Allow incoming V4 echo request" protocol="icmpv4:8,any" dir=in action=allow
netsh advfirewall firewall add rule name="Open Port 10050" dir=in action=allow protocol=TCP localport=10050
```