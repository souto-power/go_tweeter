FROM mysql:8.0-debian

# Debian Installerパラメータの一つ
# 早いうちにyumへの切り替えを行う（mysqlのdockerはoracle系に今後切り替わる）
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y locales \
	--no-install-recommends && rm -rf /var/lib/apt/lists/*

RUN dpkg-reconfigure locales && \
	locale-gen C.UTF-8 && \
	/usr/sbin/update-locale LANG=C.UTF-8

# 本当はcopyした後で権限周りの設定が必要そう
COPY ./mysql.cnf /etc/mysql/conf.d/mysql.cnf

ENV LC_ALL C.UTF-8