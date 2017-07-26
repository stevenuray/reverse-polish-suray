FROM ruby:2.4.1

RUN mkdir /app
WORKDIR /app

ADD . /app
RUN bundle install

ENV RPN_INPUT_SEPARATOR=" "
ENV RPN_VALID_OPERATORS="+,-,*,/"
ENV RPN_DECIMAL_PRECISION="10"
ENV RPN_EXIT_COMMANDS="q,quit,exit"

RUN rspec

ENTRYPOINT [ "ruby", "bin/rpn_suray" ]
