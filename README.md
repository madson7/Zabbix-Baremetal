# zabbix

```
git clone https://github.com/madson7/zabbix.git

cd zabbix/zabbix-db/

sudo docker build -t zabbix-db:0.1 .

sudo docker run \
    --name zabbix-db \
    -p 3306:3306 \
    -e MYSQL_ROOT_PASSWORD=RootPassword \
    -e MYSQL_DATABASE=zabbix \
    -e MYSQL_USER=zabbix \
    -e MYSQL_PASSWORD=zabbix \
    -d zabbix-db:0.1

sudo docker run \
    --name zabbix-web \
    -e DB_SERVER_HOST="172.17.116.170" \
    -e DB_SERVER_PORT="3306" \
    -e MYSQL_USER="zabbix" \
    -e MYSQL_PASSWORD="zabbix" \
    -e PHP_TZ="America/Belem" \
    -p 8080:8080 \
    -d zabbix/zabbix-web-apache-mysql

```


$ sudo docker run --link zabbix-db -it arey/mysql-client -h mysql -p zabbix -D zabbix


sudo docker container inspect