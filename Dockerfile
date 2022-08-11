FROM ruby:2.6.2

RUN apt-get update -qq

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list


RUN apt-get install -y nodejs
RUN apt-get update && apt-get install -y yarn
RUN apt-get clean

RUN mkdir /ouk
WORKDIR /ouk
ADD Gemfile /ouk/Gemfile
ADD Gemfile.lock /ouk/Gemfile.lock
ADD package.json /ouk/package.json

RUN bundle install

ADD . /ouk