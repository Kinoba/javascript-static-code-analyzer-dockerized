FROM node:18

ENV LC_ALL=C.UTF-8
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US.UTF-8
ENV PATH="$PATH:/app/node_modules/.bin"

WORKDIR /app

RUN useradd -ms /bin/bash jsman \
    && mkdir -p /app/node_modules \
    && touch /app/yarn-error.log \
    && chown jsman:jsman \
         /app/node_modules \
         /app/yarn-error.log \
    && ln -s /app/node_modules /

USER jsman

COPY package.json yarn.lock /app/

RUN yarn install