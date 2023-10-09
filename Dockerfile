FROM openjdk:8-alpine

ENV PMD_VERSION 7.0.0-rc4

RUN apk add --update --no-cache wget unzip git bash
RUN mkdir -p /opt

RUN cd /opt \
    && wget -nc -O pmd.zip https://github.com/pmd/pmd/releases/download/pmd_releases/${PMD_VERSION}/pmd-dist-${PMD_VERSION}-bin.zip \
    && unzip pmd.zip \
    && rm -f pmd.zip \
    && mv pmd-bin-${PMD_VERSION} pmd

RUN chmod +x /opt/pmd/bin/pmd
RUN ln -s /opt/pmd/bin/pmd /usr/bin/pmd

RUN mkdir /src
VOLUME /src
WORKDIR /src

CMD ["pmd"]
