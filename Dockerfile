FROM mysql
ENV MYQL_DATABASE me
ADD ./init-scripts/ /docker-entrypoint-initdb.d/