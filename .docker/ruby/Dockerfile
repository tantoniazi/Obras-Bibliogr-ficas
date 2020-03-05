FROM ruby:2.6.3

RUN apt-get update -qq && apt-get install -y build-essential

RUN apt-get install -y libxml2-dev libxslt1-dev libqt4-dev xvfb nodejs git-core curl build-essential openssl libssl-dev 

WORKDIR /myapp
COPY ./Gemfile* ./
RUN bundle install
COPY . .

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]

