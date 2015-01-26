FROM mattgruter/doubledocker

MAINTAINER Larry Owen <larry.owen@gmail.com>

RUN apt-get -y install htop
RUN apt-get -y install wget
RUN wget http://downloads.drone.io/master/drone.deb
RUN dpkg -i drone.deb

EXPOSE 80

VOLUME /var/lib/drone

ENV DRONE_SERVER_PORT :80
ENV DRONE_DATABASE_DATASOURCE /var/lib/drone/drone.sqlite

CMD /etc/init.d/docker start && /usr/local/bin/droned -gitlab.skip-cert-check=true

