# This is the Dockerfile used for building the sample app
FROM golang:1.20-alpine AS build_base

WORKDIR /build

COPY go.mod go.sum /build/
RUN go mod download
COPY cmd /build/cmd
COPY internal /build/internal
RUN CGO_ENABLED=0 go build -o /build/server github.com/nico151999/envoy_gateway_evaluation/cmd


# Use distroless as minimal base image to package the manager binary
# Refer to https://github.com/GoogleContainerTools/distroless for more details
FROM gcr.io/distroless/static:nonroot

COPY --from=build_base /build/server /app/server
EXPOSE 8080
ENTRYPOINT ["/app/server"]