FROM mcr.microsoft.com/dotnet/sdk:6.0

WORKDIR /docker
RUN curl -L 'https://download.docker.com/linux/static/stable/x86_64/docker-20.10.9.tgz' -o ./docker.tgz
RUN tar -xzvf ./docker.tgz
RUN mv ./docker/* /usr/bin/

WORKDIR /
RUN rm -rvf /docker

RUN curl -L https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
RUN chmod a+x /usr/local/bin/docker-compose
