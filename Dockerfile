FROM debian:jessie
RUN apt-get update && apt-get install -y git-core openssh-client openssh-server tar gzip ca-certificates
# deps for postgres and our project reqs
RUN apt-get install -y python-dev python-pip python3-dev build-essential postgresql-9.4 postgresql-client-9.4 redis-server
RUN pip install tox
# copy our override
COPY pg_hba.conf /etc/postgresql/9.4/main/pg_hba.conf
LABEL com.circleci.preserve-entrypoint=true
COPY start.bash start.bash

ENTRYPOINT /bin/bash start.bash
