# Ruby static code analyzer

## Usage

```bash
docker run --rm -v $(pwd):/app kinoba/javascript-static-code-analyzer [static tool]
```

### Available tools

For now this image is able to run:

- Eslint
- Stylelint

## Contribute

```bash
DOCKER_DEFAULT_PLATFORM=linux/amd64 docker build . -t kinoba/javascript-static-code-analyzer
docker push kinoba/javascript-static-code-analyzer
```

## TODO

- Remove deprecated `babel-eslint` package
