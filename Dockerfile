    
# https://hub.docker.com/_/elixir/
FROM elixir:1.9.0

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
  apt-get install -y postgresql-client inotify-tools
RUN mix archive.install --force \
  https://github.com/phoenixframework/archives/raw/master/phx_new.ez
RUN mix local.hex --force
RUN mix local.rebar --force

RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -
RUN apt-get install -y -q nodejs
RUN apt-get install -y -q inotify-tools

RUN mkdir -p /app
COPY . /app
WORKDIR /app

ENV MIX_ENV dev

EXPOSE 4040
EXPOSE 4041
