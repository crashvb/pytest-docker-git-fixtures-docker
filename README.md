# pytest-docker-git-fixtures-docker

## Overview

This docker image is a minimalistic apache2+git setup for testing with [pytest-docker-git-fixtures](https://github.com/crashvb/pytest-docker-git-fixtures).

## Usage

Bare repositories can be provisioned under `/srv/git` using `create-repo`, and credentials can be provisioned in `/srv/git/.htpasswd` using `allow-user`. Repositories are served with anonymous read / authenticated write under the location `/insecure/<repo>.git`, and with authenticated read and write under `/secure/<repo>.git`.

## Entrypoint Scripts

None.

## Standard Configuration

### Container Layout

```
/
├─ bin/
│  ├─ allow-user
│  └─ create-repo
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

