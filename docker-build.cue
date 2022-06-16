package main

import (
    "dagger.io/dagger"
    "universe.dagger.io/docker"
)

dagger.#Plan & {
  client: {
    filesystem: ".": read: contents: dagger.#FS
    env: {
        RELEASE_VERSION: string
        REGISTRY_USER: string
        REGISTRY_TOKEN: dagger.#Secret
    }
  }

  actions: {
    publish: {
      build: docker.#Dockerfile & {
        source: client.filesystem.".".read.contents
      }
      push: docker.#Push & {
        image: build.output
        dest:  "ghcr.io/camptocamp/blackbox-exporter-idm-ca:\(client.env.RELEASE_VERSION)"
        auth: {
          username: client.env.REGISTRY_USER
          secret:   client.env.REGISTRY_PASS
        }
      }
    }
  }
}
