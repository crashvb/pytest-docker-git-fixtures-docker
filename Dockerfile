FROM crashvb/httpd:202303032354@sha256:5c0858ba4455c9509e27b98fe6047e4d67b490e867844a503a795470612a9837
ARG org_opencontainers_image_created=undefined
ARG org_opencontainers_image_revision=undefined
LABEL \
	org.opencontainers.image.authors="Richard Davis <crashvb@gmail.com>" \
	org.opencontainers.image.base.digest="sha256:5c0858ba4455c9509e27b98fe6047e4d67b490e867844a503a795470612a9837" \
	org.opencontainers.image.base.name="crashvb/httpd:202303032354" \
	org.opencontainers.image.created="${org_opencontainers_image_created}" \
	org.opencontainers.image.description="Image containing clamav." \
	org.opencontainers.image.licenses="Apache-2.0" \
	org.opencontainers.image.source="https://github.com/crashvb/clamav-docker" \
	org.opencontainers.image.revision="${org_opencontainers_image_revision}" \
	org.opencontainers.image.title="crashvb/clamav" \
	org.opencontainers.image.url="https://github.com/crashvb/clamav-docker"
LABEL maintainer="Richard Davis <crashvb@gmail.com>"

# Install packages, download files ...
ENV GIT_PROJECT_ROOT=/srv/git
COPY allow-user create-repo mirror-repo /bin/
RUN APT_ALL_REPOS=1 docker-apt git ssl-cert && \
    install --directory --group www-data ${GIT_PROJECT_ROOT}

# Configure: httpd
COPY apache.git /etc/apache2/vhost.d/git
RUN a2enmod rewrite ssl && \
	a2ensite default-ssl && \
	echo "pytest-docker-git-fixtures-docker" > /var/www/html/index.html

# TODO: https://git-scm.com/book/en/v2/Git-on-the-Server-Setting-Up-the-Server

# Configure: entrypoint
COPY entrypoint.init-repos /etc/entrypoint.d/init-repos

