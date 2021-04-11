FROM node:12

ENV LC_ALL=C.UTF-8
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US.UTF-8
ENV PATH="$PATH:/node_modules/.bin"

ARG eslint_version=5.16.0
ARG eslint_plugin_vue_version=6.2.2
ARG typescript_version=3.5.3
ARG typescript_eslint_plugin_version=2.10.0
ARG typescript_eslint_parser_version=2.10.0
ARG babel_eslint_version=10.1.0
ARG stylelint_version=^13.3.2
ARG stylelint_checkstyle_formatter_version=^0.1.2
ARG stylelint_config_sass_guidelines_version=^7.0.0
ARG stylelint_config_standard_version=^20.0.0
ARG stylelint_scss_version=^3.17.1

RUN useradd -ms /bin/bash jsman \
    && mkdir /node_modules \
    && touch /yarn.lock \
             /yarn-error.log \
    && echo {} > /package.json \
    && chown jsman:jsman \
         /node_modules \
         /yarn.lock \
         /yarn-error.log \
         /package.json

USER jsman

RUN yarn add global \
    eslint@${eslint_version} \
    eslint-plugin-vue@${eslint_plugin_vue_version} \
    typescript@${typescript_version} \
    @typescript-eslint/eslint-plugin@${typescript_eslint_plugin_version} \
    @typescript-eslint/parser@${typescript_eslint_parser_version} \
    babel-eslint@${babel_eslint_version} \
    stylelint@${stylelint_version} \
    stylelint-checkstyle-formatter@${stylelint_checkstyle_formatter_version} \
    stylelint-config-sass-guidelines@${stylelint_config_sass_guidelines_version} \
    stylelint-config-standard@${stylelint_config_standard_version} \
    stylelint-scss@${stylelint_scss_version}

WORKDIR /app