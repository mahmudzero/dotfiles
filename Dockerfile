FROM debian:latest

RUN mkdir dotfiles
ADD ./ ./dotfiles

CMD sleep infinity
