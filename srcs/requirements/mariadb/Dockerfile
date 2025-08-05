FROM mariadb:10.11

COPY my.cnf /etc/mysql/my.cnf
COPY setup.sh /docker-entrypoint-initdb.d/setup.sh

RUN chmod +x /docker-entrypoint-initdb.d/setup.sh

EXPOSE 3306



