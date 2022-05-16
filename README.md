<p align="center"><img src="https://res.cloudinary.com/tryvium/image/upload/v1551645701/company/logo-circle.png"/></p>

# Netlify CLI in Docker - The Tryvium Company LTD
![Dockerhub Name](https://img.shields.io/badge/dockerhub-tryvium%2Fnetlify--cli-blue)
![Dockerhub Pulls](https://img.shields.io/docker/pulls/tryvium/netlify-cli.svg)
[![FOSSA Status](https://app.fossa.com/api/projects/git%2Bgithub.com%2Ftryvium-travels%2Fdocker-netlify-cli.svg?type=shield)](https://app.fossa.com/projects/git%2Bgithub.com%2Ftryvium-travels%2Fdocker-netlify-cli?ref=badge_shield)

The netlify-cli package available as a Docker Image

## Usage

You can use the image in multiple ways:

### In other dockerfiles as a source image

``` Dockerfile
FROM tryvium/netlify-cli
# ADD or COPY other files and run commands like build and deploy

# Remove or change the inherited entrypoint if you need it.
ENTRYPOINT [""]
```

### As a standalone netlify CLI

``` bash
$ docker run -e NETLIFY_AUTH_TOKEN="YOUR NETLIFY TOKEN" tryvium/netlify-cli # command and parameters ...
$ # for example
$ # docker run -e NETLIFY_AUTH_TOKEN="YOUR NETLIFY TOKEN" tryvium/netlify-cli deploy
```

The image is not tested with build and deploy commands, so we encourage you to open issues and PRs if
you encounter any problem

### In a CI environment

Here an example using Gitlab CI

``` yaml
Deploy to netlify:
  image: 
    name: tryvium/netlify-cli
    entrypoint: [""]
  environment: 
    NETLIFY_AUTH_TOKEN: "YOUR NETLIFY TOKEN"
  script: 
    - netlify -h
```


## License
[![FOSSA Status](https://app.fossa.com/api/projects/git%2Bgithub.com%2Ftryvium-travels%2Fdocker-netlify-cli.svg?type=large)](https://app.fossa.com/projects/git%2Bgithub.com%2Ftryvium-travels%2Fdocker-netlify-cli?ref=badge_large)