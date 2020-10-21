# zabbix


```
git clone https://github.com/madson7/zabbix.git

cd zabbix/

mkdir -p ./zbx_env/usr/lib/zabbix/externalscripts \
./zbx_env/etc/zabbix/zabbix_agentd.d \
./zbx_env/var/lib/zabbix/modules \
./zbx_env/var/lib/zabbix/enc \
./zbx_env/var/lib/zabbix/snmptraps \
./zbx_env/var/lib/mysql

sudo microk8s kubectl apply -f config/
sudo microk8s kubectl apply -f zabbix/server/
sudo microk8s kubectl apply -f zabbix/web/
sudo microk8s kubectl apply -f grafana/


sudo microk8s kubectl exec -it zabbix-server-6c8895df8-ss4j2 -- ls /usr/lib/zabbix/alertscripts






sudo docker run -d \
  --restart=always \
  --name zabbix-agent \
  -p 10050:10050 \
  -v /proc:/host/proc:ro \
  -v /sys:/host/sys:ro \
  -v /dev:/host/dev:ro \
  -v /etc:/host/etc:ro \
  -v /var/run/docker.sock:/host/var/run/docker.sock \
  -e HOST=agent \
  zabbix/zabbix-agent

```


# Agent windows
```
https://www.zabbix.com/download_agents
C:\zabbix\bin\zabbix_agent2.exe -c C:\zabbix\conf\zabbix_agent2.conf -i
netsh advfirewall firewall add rule name="ICMP Allow incoming V4 echo request" protocol="icmpv4:8,any" dir=in action=allow
netsh advfirewall firewall add rule name="Open Port 10050" dir=in action=allow protocol=TCP localport=10050
```