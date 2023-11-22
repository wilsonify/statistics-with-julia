
generated:
	docker run --rm \
  -u $(shell id -u):$(shell id -g) \
  -v "$(shell pwd):/local" \
  openapitools/openapi-generator-cli:latest generate \
  -i /local/openapi/openapi.yaml \
  -g julia-server \
  -o /local/generated \
  --additional-properties=packageName=statistics-with-julia-api \
  --additional-properties=exportModels=true

