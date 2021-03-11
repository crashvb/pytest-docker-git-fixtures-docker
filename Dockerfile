FROM crashvb/httpd:202101262245
LABEL maintainer="Richard Davis <crashvb@gmail.com>"

# Install packages, download files ...
ENV GIT_PROJECT_ROOT=/srv/git
ADD allow-user create-repo mirror-repo /bin/
RUN APT_ALL_REPOS=1 docker-apt git ssl-cert && \
    install --directory --group www-data ${GIT_PROJECT_ROOT}

# Configure: httpd
ADD apache.git /etc/apache2/vhost.d/git
RUN a2enmod rewrite ssl && \
	a2ensite default-ssl && \
	echo "pytest-docker-git-fixtures-docker" > /var/www/html/index.html

# TODO: https://git-scm.com/book/en/v2/Git-on-the-Server-Setting-Up-the-Server

# Configure: entrypoint
ADD entrypoint.init-repos /etc/entrypoint.d/init-repos

