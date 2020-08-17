FROM ruby:2.6.2

WORKDIR /usr/src/app
COPY Gemfile .
COPY Gemfile.lock .
RUN gem sources --add https://gems.ruby-china.com/ --remove https://rubygems.org/
RUN gem install bundler
RUN bundle config mirror.https://rubygems.org https://gems.ruby-china.com
RUN bundle install
COPY . .
RUN bundle exec rake app:update:bin
EXPOSE 3000
CMD [ "bin/rails", "server", "-b","0.0.0.0", "-p","3000"]
