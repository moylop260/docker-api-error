FROM ubuntu:14.04

RUN apt-get update -qq && apt-get install -qqy \
    apt-transport-https \
    ca-certificates \
    curl \
    lxc \
    iptables \
    unzip

# Install Docker from Docker Inc. repositories.
RUN curl -sSL https://get.docker.com/ubuntu/ | sh

# Install the magic wrapper.
RUN curl https://raw.githubusercontent.com/jpetazzo/dind/master/wrapdocker -o    && \
    chmod +x /usr/local/bin/wrapdocker

# Define additional metadata for our image.
VOLUME /var/lib/docker
ENV PORT 2376
CMD ["wrapdocker"]
EXPOSE ${PORT}
