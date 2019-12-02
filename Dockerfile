FROM ruby:2.5.1-alpine

RUN apk update \
  && apk upgrade \
  && apk add --update --no-cache \
  build-base postgresql-dev tzdata

RUN mkdir /app
WORKDIR /app

COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock

ENV BUNDLER_VERSION 2.0.2
RUN gem install bundler \
  && bundle install

COPY . /app

EXPOSE 3000
