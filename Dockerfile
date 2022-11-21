FROM node:19.1.0

ENV LC_ALL=C.UTF-8
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US.UTF-8
ENV PATH="$PATH:/node_modules/.bin"

ARG angular_eslint_eslint_plugin_version=^13.1.0
ARG angular_eslint_eslint_plugin_template_version=^13.1.0
ARG babel_core_version=^7.17.0
ARG babel_eslint_parser_version=^7.17.0
ARG eslint_version=^8.10.0
ARG eslint_config_airbnb_base_version=^14.2.1
ARG eslint_config_prettier_version=8.3.0
ARG eslint_plugin_import_version=^2.25.4
ARG eslint_plugin_jest_version=^26.1.1
ARG eslint_plugin_jsdoc_version=^37.9.6
ARG eslint_plugin_jsx_a11y_version=6.4.1
ARG eslint_plugin_node_version=11.1.0
ARG eslint_plugin_prefer_arrow_version=^1.2.2
ARG eslint_plugin_prettier_version=3.4.0
ARG eslint_plugin_react_hooks_version=^4.0.8
ARG eslint_plugin_react_version=7.24.0
ARG eslint_plugin_vue_version=^8.4.1
ARG jest_version=^26.6.3
ARG nuxtjs_eslint_config_typescript_version=^9.0.0
ARG postcss_version=^8
ARG postcss_html_version=^1.3.0
ARG prettier_version=2.3.0
ARG typescript_version=3.5.3
ARG typescript_eslint_plugin_version=^5.10.0
ARG typescript_eslint_parser_version=5.0.0
ARG stylelint_version=^14.3.0
ARG stylelint_checkstyle_formatter_version=^0.1.2
ARG stylelint_config_sass_guidelines_version=^9.0.0
ARG stylelint_config_standard_version=^24.0.0
ARG stylelint_config_recommended_vue_version=^1.1.0
ARG stylelint_scss_version=^4.1.0
ARG vue_version=^3.2.31
ARG vue_cli_plugin_eslint_version=^5.0.0

RUN useradd -ms /bin/bash jsman \
    && mkdir /node_modules \
    && touch /yarn.lock \
             /yarn-error.log \
    && echo "{ \"license\": \"UNLICENSED\" }" > /package.json \
    && chown jsman:jsman \
         /node_modules \
         /yarn.lock \
         /yarn-error.log \
         /package.json

USER jsman

RUN yarn add global \
    @angular-eslint/eslint-plugin@${angular_eslint_eslint_plugin_version} \
    @angular-eslint/eslint-plugin-template@${angular_eslint_eslint_plugin_template_version} \
    @babel/core@${babel_core_version} \
    @babel/eslint-parser@${babel_eslint_parser_version} \
    eslint@${eslint_version} \
    eslint-config-airbnb-base@${eslint_config_airbnb_base_version} \
    eslint-config-prettier@${eslint_config_prettier_version} \
    eslint-plugin-import@${eslint_plugin_import_version} \
    eslint-plugin-jest@${eslint_plugin_jest_version} \
    eslint-plugin-jsdoc@${eslint_plugin_jsdoc_version} \
    eslint-plugin-prefer-arrow@${eslint_plugin_prefer_arrow_version} \
    eslint-plugin-node@${eslint_plugin_node_version} \
    eslint-plugin-prettier@${eslint_plugin_prettier_version} \
    eslint-plugin-react@${eslint_plugin_react_version} \
    eslint-plugin-react-hooks@${eslint_plugin_react_hooks_version} \
    eslint-plugin-vue@${eslint_plugin_vue_version} \
    eslint-plugin-prettier@${eslint_plugin_prettier_version} \
    eslint-config-prettier@${eslint_config_prettier_version} \
    eslint-plugin-jsx-a11y@${eslint_plugin_jsx_a11y_version} \
    eslint-plugin-react@${eslint_plugin_react_version} \
    jest@${jest_version} \
    @nuxtjs/eslint-config-typescript@${nuxtjs_eslint_config_typescript_version} \
    postcss@${postcss_version} \ 
    postcss-html@${postcss_html_version} \
    prettier@${prettier_version} \
    typescript@${typescript_version} \
    @typescript-eslint/eslint-plugin@${typescript_eslint_plugin_version} \
    @typescript-eslint/parser@${typescript_eslint_parser_version} \
    stylelint@${stylelint_version} \
    stylelint-checkstyle-formatter@${stylelint_checkstyle_formatter_version} \
    stylelint-config-sass-guidelines@${stylelint_config_sass_guidelines_version} \
    stylelint-config-standard@${stylelint_config_standard_version} \
    stylelint-config-recommended-vue@${stylelint_config_recommended_vue_version} \
    stylelint-scss@${stylelint_scss_version} \
    vue@${vue_version} \
    @vue/cli-plugin-eslint@${vue_cli_plugin_eslint_version}

WORKDIR /app