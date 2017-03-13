FROM golang:1.8.0

MAINTAINER Luis Mayta <@slovacus>

ENV GLIDE_VERSION 0.12.3

ENV GLIDE_DOWNLOAD_URL https://github.com/Masterminds/glide/releases/download/v${GLIDE_VERSION}/glide-v${GLIDE_VERSION}-linux-amd64.tar.gz

ONBUILD RUN curl -fsSL "$GLIDE_DOWNLOAD_URL" -o glide.tar.gz \
    && tar -xzf glide.tar.gz \
    && mv linux-amd64/glide /usr/bin/ \
    && rm -r linux-amd64 \
    && rm glide.tar.gz

RUN go get github.com/alecthomas/gometalinter && \
    gometalinter --install --update

RUN mkdir -p ${GOPATH}/src/go-iris-example

COPY . ${GOPATH}/src/go-iris-example

# set working directory to /app/
WORKDIR ${GOPATH}/src/go-iris-example/

# install python dependencies
# RUN glide install
