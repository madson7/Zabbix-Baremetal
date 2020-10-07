# zabbix


```
git clone https://github.com/madson7/zabbix.git

cd zabbix/


```

```
sudo docker run --name mysql-server -t \
      -e MYSQL_DATABASE="zabbix" \
      -e MYSQL_USER="zabbix" \
      -e MYSQL_PASSWORD="zabbix" \
      -e MYSQL_ROOT_PASSWORD="root_pwd" \
      -d mysql:5.7 \
      --character-set-server=utf8 --collation-server=utf8_bin

```
https://www.zabbix.com/download_agents
C:\zabbix\bin\zabbix_agent2.exe -c C:\zabbix\conf\zabbix_agent2.conf -i

netsh advfirewall firewall add rule name="ICMP Allow incoming V4 echo request" protocol="icmpv4:8,any" dir=in action=allow
netsh advfirewall firewall add rule name="Open Port 32534" dir=in action=allow protocol=TCP localport=32534

