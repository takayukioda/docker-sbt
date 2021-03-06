FROM takayukioda/scala:2.11.8
MAINTAINER takayukioda <takayuki@odashi.me>

ENV SBT_VERSION 0.13.12

WORKDIR /tmp
# Install sbt
RUN set -x \
	&& curl -fsL -o sbt-$SBT_VERSION.deb http://dl.bintray.com/sbt/debian/sbt-$SBT_VERSION.deb \
	&& dpkg -i sbt-$SBT_VERSION.deb \
	&& apt-get update \
	&& apt-get install -y sbt \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
	&& sbt sbtVersion

WORKDIR /root
