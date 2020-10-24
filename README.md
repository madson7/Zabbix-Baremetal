git clone https://github.com/madson7/zabbix.git

cd zabbix/

sudo microk8s.enable dns

sudo microk8s kubectl apply -f ./Configs/Namespace.yaml

sudo microk8s kubectl apply -f ./Configs/List.yaml

sudo microk8s kubectl apply -f ./Volumes/zabbix-mysql-data.yaml

sudo microk8s kubectl apply -f ./Replication/mysql-server.yaml
sudo microk8s kubectl apply -f ./Replication/

sudo microk8s kubectl apply -f ./Services/mysql-server.yaml
sudo microk8s kubectl apply -f ./Services/
sudo microk8s kubectl apply -f ./Services/




# Agent windows
```
https://www.zabbix.com/download_agents
C:\zabbix\bin\zabbix_agent2.exe -c C:\zabbix\conf\zabbix_agent2.conf -i
netsh advfirewall firewall add rule name="ICMP Allow incoming V4 echo request" protocol="icmpv4:8,any" dir=in action=allow
netsh advfirewall firewall add rule name="Open Port 10050" dir=in action=allow protocol=TCP localport=10050
```