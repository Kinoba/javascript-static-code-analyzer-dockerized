FROM node:23.8.0

ENV LC_ALL=C.UTF-8
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US.UTF-8
ENV PATH="$PATH:/app/node_modules/.bin"
ENV NODE_OPTIONS=--max_old_space_size=12288

WORKDIR /app

RUN groupadd -g 7777 jsman \
  && useradd -m -s /bin/bash -u 7777 -g 7777 jsman \
  && mkdir -p /app/node_modules \
  && touch /app/yarn-error.log \
  && chown -R jsman:jsman /app/ \
  && ln -s /app/node_modules /

USER jsman

COPY --chown=jsman:jsman package.json yarn.lock /app/

RUN yarn install --frozen-lockfile
