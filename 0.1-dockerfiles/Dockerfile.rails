FROM ruby:3.1-alpine

RUN apk add --no-cache gcc musl-dev make libpq-dev tini tzdata

RUN adduser -D pele

ENV RAILS_ROOT=/app
RUN mkdir -p ${RAILS_ROOT}/tmp/pids \
  && chown -R pele:pele ${RAILS_ROOT}

USER pele
WORKDIR ${RAILS_ROOT}

COPY --chown=pele:pele Gemfile Gemfile.lock ./
RUN bundle install --jobs 20 --retry 5

COPY --chown=pele:pele . .

EXPOSE 3000
ENTRYPOINT [ "tini", "--" ]
CMD ["sh", "-c", "./entrypoint.sh"]
