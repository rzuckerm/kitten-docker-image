FROM ubuntu:20.04

COPY KITTEN_* /tmp/
RUN apt-get update && \
    apt-get install -y git ghc cabal-install zlib1g-dev && \
    mkdir -p /opt && \
    cd /opt && \
    git clone https://github.com/evincarofautumn/kitten && \
    cd kitten && \
    cabal sandbox init && \
    cabal update && \
    cabal install --only-dependencies && \
    cabal install --prefix=/usr/local && \
    cp common.ktn /usr/local/bin && \
    cd / && \
    apt-get remove -y git cabal-install && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /opt/kitten /root/.cabal /var/lib/apt/lists/*
