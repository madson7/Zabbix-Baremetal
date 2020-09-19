# zabbix

```
sudo docker build -t zabbix-db:0.1 .

sudo docker run \
    --name zabbix-db \
    -d \
    -p 3306:3306 \
    -e MYSQL_ROOT_PASSWORD=RootPassword \
    -e MYSQL_DATABASE=zabbix \
    -e MYSQL_USER=zabbix \
    -e MYSQL_PASSWORD=zabbix \
    zabbix-db:0.1

sudo docker run \
    --name zabbix-web \
    -e DB_SERVER_HOST="192.168.0.28" \
    -e DB_SERVER_PORT="3306" \
    -e MYSQL_USER="zabbix" \
    -e MYSQL_PASSWORD="zabbix" \
    -e PHP_TZ="America/Belem" \
    -p 8080:8080 \
    -d \
    zabbix/zabbix-web-apache-mysql

```


$ docker run --link zabbix-db -it arey/mysql-client -h mysql -p zabbix -D zabbix


docker container inspect