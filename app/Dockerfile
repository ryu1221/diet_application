FROM ruby

WORKDIR /app

ADD Gemfile Gemfile
ADD Gemfile.lock Gemfile.lock

RUN apt-get update && \
    apt-get install -y nodejs && \
    apt-get install -y vim && \
    apt-get install -y mariadb-client && \
    curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list &&\
    apt-get update && apt-get install -y yarn && \
    apt-get install --no-install-recommends yarn && \
    gem install bundler && \
    bundle install