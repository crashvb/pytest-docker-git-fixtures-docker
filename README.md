# pytest-docker-git-fixtures-docker

[![version)](https://img.shields.io/docker/v/crashvb/pytest-docker-git-fixtures-docker/latest)](https://hub.docker.com/repository/docker/crashvb/pytest-docker-git-fixtures-docker)
[![image size](https://img.shields.io/docker/image-size/crashvb/pytest-docker-git-fixtures-docker/latest)](https://hub.docker.com/repository/docker/crashvb/pytest-docker-git-fixtures-docker)
[![linting](https://img.shields.io/badge/linting-hadolint-yellow)](https://github.com/hadolint/hadolint)
[![license](https://img.shields.io/github/license/crashvb/pytest-docker-git-fixtures-docker.svg)](https://github.com/crashvb/pytest-docker-git-fixtures-docker/blob/master/LICENSE.md)

## Overview

This docker image is a minimalistic apache2+git setup for testing with [pytest-docker-git-fixtures](https://github.com/crashvb/pytest-docker-git-fixtures).

## Usage

Bare repositories can be provisioned under `/srv/git` using `create-repo`, and credentials can be provisioned in `/srv/git/.htpasswd` using `allow-user`. Repositories are served with anonymous read / authenticated write under the location `/insecure/<repo>.git`, and with authenticated read and write under `/secure/<repo>.git`.

## Entrypoint Scripts

### init-repos

The embedded entrypoint script is located at `/etc/entrypoint.d/init-repos` and performs the following actions:

1. The `/bin/create-repo` command is invoked for all repos contained in `PDGF_CREATE_REPOS`.
2. The `/bin/mirror-repo` command is invoked for all repos contained in `PDGF_MIRROR_REPOS`.
None.

## Standard Configuration

### Container Layout

```
/
├─ bin/
│  ├─ allow-user
│  ├─ create-repo
│  └─ mirror-repo
├─ etc/
│  └─ apache2/
│     └─ vhosts.d/
│        └─ git
└─ srv/
   └─ git/
```

### Exposed Ports

None.

### Volumes

None.

## Development

[Source Control](https://github.com/crashvb/pytest-docker-git-fixtures-docker)

