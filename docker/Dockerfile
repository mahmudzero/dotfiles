FROM debian:latest AS base

RUN apt update
RUN apt upgrade
RUN apt install -y git curl build-essential

FROM base AS dotfiles
RUN mkdir dotfiles
ADD ./ ./dotfiles

CMD ["sleep", "infinity"]
