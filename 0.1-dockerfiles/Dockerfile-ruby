FROM ruby:2.7
WORKDIR /myapp
COPY . .
RUN bundle install

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]