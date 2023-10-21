
generated:
	docker run --rm \
  -u $(id -u):$(id -g) \
  -v "${PWD}:/local" \
  openapitools/openapi-generator-cli:latest generate \
  -i /local/openapi/openapi.yaml \
  -g julia-server \
  -o /local/generated \
  --additional-properties=packageName=statistics-with-julia-api \
  --additional-properties=exportModels=true

