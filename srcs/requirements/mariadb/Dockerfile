FROM debian:bullseye

RUN apt -y update
RUN apt -y upgrade
RUN apt-get -y install mariadb-server

COPY ./conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf

COPY ./tool/initmysql.sh	initmysql.sh


ENTRYPOINT ["bash", "initmysql.sh"]