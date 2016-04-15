FROM ruby:2.3.0

RUN apt-get update -qq && apt-get install -y --no-install-recommends \
  build-essential \
  libpq-dev \
  libxml2-dev \
  libxslt1-dev \
  libqt4-webkit \
  libqt4-dev \
  xvfb \
  nodejs

ENV APP_HOME /app
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

COPY Gemfile* $APP_HOME/
RUN bundle install --retry=5

COPY . $APP_HOME
