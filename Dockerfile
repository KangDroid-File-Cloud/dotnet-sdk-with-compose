FROM mcr.microsoft.com/dotnet/sdk:6.0

WORKDIR /docker
RUN curl -L 'https://download.docker.com/linux/static/stable/x86_64/docker-20.10.9.tgz' -o ./docker.tgz
RUN tar -xzvf ./docker.tgz
RUN mv ./docker/* /usr/bin/

WORKDIR /mongo
RUN curl -L 'https://downloads.mongodb.com/compass/mongosh-1.5.4-linux-x64.tgz' -o ./mongosh.tgz
RUN tar -xzvf ./mongosh.tgz
RUN mv mongosh-1.5.4-linux-x64/bin/* /usr/bin/
RUN chmod a+x /usr/bin/mongosh

RUN curl -L https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
RUN chmod a+x /usr/local/bin/docker-compose

RUN dotnet tool install -g JetBrains.ReSharper.GlobalTools
ENV PATH="${PATH}:/root/.dotnet/tools"

WORKDIR /
RUN rm -rvf /docker
RUN rm -rvf /mongo
