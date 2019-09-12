FROM bitwalker/alpine-elixir-phoenix:latest

ENV DEBIAN_FRONTEND=noninteractive
ENV MIX_ENV dev

RUN mkdir -p /umbrella
COPY . /umbrella
WORKDIR /umbrella

RUN mix deps.get

RUN mix phx.digest

EXPOSE 4000
EXPOSE 4001

CMD ["mix", "phx.server"]