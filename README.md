## lucapxl/smashing
modified version of [https://github.com/visibilityspots/dockerfile-smashing](https://github.com/visibilityspots/dockerfile-smashing)

## Run
```docker run -d -p 8080:3030 lucapxl/smashing```

And point your browser to [http://localhost:8080/](http://localhost:8080/).

## Build
```docker build -t lucapxl/smashing .```

## Debug
```docker run --rm -i -t lucapxl/smashing /bin/sh```

## Configuration
### Custom smashing port
If you want smashing to use a custom port inside the container, e g 8080, use the environment variable `$PORT`:

```docker run -d -e PORT=8080 -p 80:8080 lucapxl/smashing```

### Smashing Volume
you can use your own volume for the smashing folder.
if the folder is empty, when the container starts it will create the sample dashboard otherwise it will just use whatever is already present

```docker run -v=/my/custom/smashing:/smashing -d -p 8080:3030 lucapxl/smashing```

## License
Distributed under the MIT license