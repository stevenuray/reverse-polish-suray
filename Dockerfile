FROM ruby:2.4.1

RUN mkdir /app
WORKDIR /app

ADD . /app
RUN bundle install

RUN rspec

ENTRYPOINT [ "ruby", "bin/rpn_suray" ]
