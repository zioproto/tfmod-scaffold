ARG GOLANG_IMAGE_TAG=1.19
FROM --platform=$BUILDPLATFORM mcr.microsoft.com/oss/go/microsoft/golang:${GOLANG_IMAGE_TAG} as build

FROM --platform=$BUILDPLATFORM mcr.microsoft.com/oss/go/microsoft/golang:${GOLANG_IMAGE_TAG} as runner
