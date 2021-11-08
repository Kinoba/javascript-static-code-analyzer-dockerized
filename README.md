# Ruby static code analyzer

## Usage

```
docker run --rm -v $(pwd):/app kinoba/javascript-static-code-analyzer [static tool]
```

### Available tools

For now this image is able to run:

- Eslint
- Stylelint

## Contribute

```
docker build . -t kinoba/javascript-static-code-analyzer
```

## TODO

- Remove deprecated `babel-eslint` package
