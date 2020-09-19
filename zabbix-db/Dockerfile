FROM oraclelinux:7-slim

LABEL maintainer "Madson <madson.adm7@gmail.com>"

ARG MYSQL_SERVER_PACKAGE=mysql-community-server-minimal-8.0.21
ARG MYSQL_SHELL_PACKAGE=mysql-shell-8.0.21

# Install server
RUN yum install -y https://repo.mysql.com/mysql-community-minimal-release-el7.rpm \
      https://repo.mysql.com/mysql-community-release-el7.rpm \
  && yum-config-manager --enable mysql80-server-minimal \
  && yum install -y \
      $MYSQL_SERVER_PACKAGE \
      $MYSQL_SHELL_PACKAGE \
      libpwquality \
  && yum clean all \
  && mkdir /docker-entrypoint-initdb.d

VOLUME /var/lib/mysql

COPY docker-entrypoint.sh /entrypoint.sh
COPY healthcheck.sh /healthcheck.sh
ENTRYPOINT ["/entrypoint.sh"]
HEALTHCHECK CMD /healthcheck.sh
COPY ./db/ /docker-entrypoint-initdb.d/
EXPOSE 3306 33060
CMD ["mysqld"]