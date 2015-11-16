FROM ubuntu:trusty
MAINTAINER Jamie Alessio <jamie@stoic.net>

RUN apt-get update && apt-get install -y polipo

# Enable known servers in the web interface.
# NOTE:
#   This will make the list of ALL websites AND file people
#   are accessing behind this proxy available to anyone on
#   the network. This may be desired when build servers are
#   using the proxy and undesired when humans are using it.
RUN echo 'disableServersList=false' >> /etc/polipo/config
RUN echo 'disableIndexing=false'    >> /etc/polipo/config

EXPOSE 8123
ENTRYPOINT ["polipo"]
# CMD []
