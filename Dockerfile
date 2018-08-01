FROM debian:jessie
RUN apt-get update && apt-get install -y git-core openssh-client openssh-server tar gzip ca-certificates
# deps for postgres and our project reqs
RUN apt-get install -y python-dev python-pip python3-dev build-essential postgresql-9.4 postgresql-client-9.4
RUN pip install tox
# copy our override
COPY pg_hba.conf /etc/postgresql/9.4/main/pg_hba.conf
RUN /etc/init.d/postgresql start
RUN update-rc.d postgresql enable
LABEL com.circleci.preserve-entrypoint=true
ENTRYPOINT /etc/init.d/postgresql restart && /bin/bash
