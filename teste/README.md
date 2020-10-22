cd teste

sudo microk8s kubectl apply -f ./Configs/Namespace.yaml

sudo microk8s kubectl apply -f ./Configs/List.yaml

sudo microk8s kubectl apply -f ./Volumes/zabbix-mysql-data.yaml

sudo microk8s kubectl apply -f ./Replication/mysql-server.yaml

sudo microk8s kubectl apply -f ./Services/mysql-server.yaml