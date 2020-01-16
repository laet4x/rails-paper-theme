FROM ruby:2.4.0-slim

MAINTAINER Al Francis <fr4nc1stein@gmail.com>

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

ENV PATH=/usr/src/app/bin:$PATH

COPY Gemfile /usr/src/app/
COPY Gemfile.lock /usr/src/app/

# RUN echo "deb http://http.debian.net/debian jessie-backports main" >> /etc/apt/sources.list && \
RUN apt-get update && apt-get install -y \
    build-essential cmake pkg-config git nodejs mysql-client libmysqlclient-dev && \
    apt-get autoremove

RUN gem install bundler
RUN bundle install
RUN rake db:create
RUN rake db:migrate
RUN rake db:seed

COPY . /usr/src/app
