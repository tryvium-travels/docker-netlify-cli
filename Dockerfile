ARG NODE_VERSION="alpine"
ARG NETLIFY_CLI_VERSION="latest"

FROM node:$NODE_VERSION as builder

LABEL MAINTAINER="Alessandro Sanino <a.sanino@tryvium.io>"

# Opencontainers Metadata
LABEL org.opencontainers.image.authors="Tryvium Travels LTD - Alessandro Sanino <a.sanino@tryvium.io>"
LABEL org.opencontainers.image.url="https://hub.docker.com/repository/docker/tryvium/netlify-cli"
LABEL org.opencontainers.image.source="https://github.com/tryvium-travels/docker-netlify-cli"
LABEL org.opencontainers.image.licenses="MIT"
LABEL org.opencontainers.image.title="Netlify CLI in Docker"
LABEL org.opencontainers.image.description="The netlify-cli package available as a Docker Image"
LABEL org.opencontainers.image.documentation="https://github.com/tryvium-travels/docker-netlify-cli"

ENV NETLIFY_AUTH_TOKEN=""

RUN yarn config set global-folder "/global/"
RUN yarn config set cache-folder "/tmp/yarn-cache"
RUN yarn global add \
      --non-interactive \
      node-gyp
RUN yarn global add \
      --non-interactive \
      "netlify-cli@$NETLIFY_CLI_VERSION"
RUN yarn cache clean --all
RUN wget https://gobinaries.com/tj/node-prune && \
    chmod a+x node-prune && \
    ./node-prune && \
    rm node-prune

ENTRYPOINT netlify
