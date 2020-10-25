# Zabbix
```
git clone https://github.com/madson7/zabbix.git
cd zabbix/
```

sudo microk8s.enable dns

## Configs Zabbix e Mysql
```
sudo microk8s kubectl apply -f ./Configs/
```

## Volumes
```
sudo mkdir /externalscripts
# echo 'I love Kubernetes storage!' > /externalscripts/teste.txt

sudo microk8s kubectl apply -f ./Volumes/zabbix-mysql-data.yaml
```

## Replication Zabbix e Mysql
```
sudo microk8s kubectl apply -f ./Replication/
sudo microk8s kubectl apply -f ./Services/
```

sudo microk8s kubectl exec zabbix-server-rh87r -n zabbix -- cat /usr/share/zabbix/externalscripts/teste.txt


## Grafana
```
sudo microk8s kubectl apply -f ./grafana/
```

http://192.168.0.55:30140/api_jsonrpc.php



## Agent windows
```
https://www.zabbix.com/download_agents
C:\zabbix\bin\zabbix_agent2.exe -c C:\zabbix\conf\zabbix_agent2.conf -i
netsh advfirewall firewall add rule name="ICMP Allow incoming V4 echo request" protocol="icmpv4:8,any" dir=in action=allow
netsh advfirewall firewall add rule name="Open Port 10050" dir=in action=allow protocol=TCP localport=10050
```