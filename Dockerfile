ARG GOLANG_IMAGE_TAG=1.19
FROM --platform=$BUILDPLATFORM mcr.microsoft.com/oss/go/microsoft/golang:${GOLANG_IMAGE_TAG} as build
COPY GNUmakefile /src/GNUmakefile
COPY scripts /src/scripts
RUN cd /src && \
    apt update && \
    apt install -y zip npm  && \
    make tools

FROM --platform=$BUILDPLATFORM mcr.microsoft.com/oss/go/microsoft/golang:${GOLANG_IMAGE_TAG} as runner
ARG TERRAFORM_VERSION=1.2.7
ARG TFLINT_AZURERM_VERSION=0.17.1
ARG TFLINT_BASIC_EXT_VERSION=0.0.2
ARG TFLINT_AZURERM_EXT_VERSION=0.0.1
ARG BUILDARCH
ENV TFLINT_PLUGIN_DIR /tflint
COPY --from=build $GOPATH/bin $GOPATH/bin
COPY --from=build /usr/local/bin/tflint /bin/tflint
