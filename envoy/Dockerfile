# This is the Dockerfile used for building an envoy with custom http filters

FROM  tinygo/tinygo:0.28.1 as build_base

WORKDIR /build
COPY go.mod go.sum /build/
RUN go mod download
COPY envoy/filter /build/envoy/filter
RUN tinygo build -o /build/filter.wasm -scheduler=none -target=wasi github.com/nico151999/envoy_gateway_evaluation/envoy/filter

FROM envoyproxy/envoy:distroless-v1.26.2
COPY --from=build_base /build/filter.wasm /bin/envoy/wasm/filter.wasm