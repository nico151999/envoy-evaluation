# Envoy K8s gateway evaluation
This repo implements a very simple scenario of a demo app that sits behind an Envoy gateway which is exposed via the default Ingress controller of a K8s cluster. The Envoy gateway is expected to validate requests via an OPA and implement custom http filters written in Golang.

## Setup
You are expected to create a namespace for envoy in your K8s cluster. By default the namespace `envoy` is configured in skaffold.yaml. If you want to use an image pull secret you are expected to create it in the respective namespace and reference it using the respective environment variable in the .env file which you also need to create based on the .env.dist file.


## Evaluation results
### Routing
- [x] HTTP-Header
- [x] HTTP-Routes
- [x] Domains

### Supported Upstream protocols:
- [x] HTTP
- [x] gRPC
- [ ] NATS # NOTE: probably possible by using an so file as a filter but this was not evaluated yet

### Authentication
- [x] OAUTH2 # NOTE: there is a dedicated OAUTH2 filter handling redirects depending on if a user is authenticated
- [x] Basic # NOTE: no built-in functionality but can be easily added using custom filters like this one: https://gist.github.com/dio/7a7aa09ea5027c660e0c1c9905be7ffd
- [x] JWT Cert caching # NOTE: the JWT filter allows for hardcoding a cert or providing a remote endpoint. The cert refresh interval from the remote endpoint can be specified.
- [x] Enrich request with user metadata (e.g. via WASM filter)

### Authorization
- [ ] Internal Authorizer
- [x] External Authorizer # NOTE: OPA (with an official plugin) and Ory Oathkeeper support the gRPC spec of Envoy's external authorization filter

### Miscellaneous
- [x] Extensibility (using Golang shared libs, Lua, WASM...)

### Metrics
- [x] Prometheus # NOTE: the Envoy admin interface allows for accessing metrics in various formats including Prometheus

### Tracing
- [x] OTEL

### Logging:
- [ ] ELK # NOTE: couldn't find a way of actively pushing logs to an Elastic instance; envoy can write both system logs and access logs to various destinations like files which allows for various solutions like a fluent bit sidecar. At least access logs can also be exported to gRPC endpoints or open telemetry endpoints.