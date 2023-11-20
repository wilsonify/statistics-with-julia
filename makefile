

base:
	docker build --progress=plain -t "ghcr.io/wilsonify/stats-with-julia-base:latest" -f Dockerfile-base .

builder:
	docker build --progress=plain -t "ghcr.io/wilsonify/stats-with-julia-builder:latest" -f Dockerfile-builder .

image:
	docker build --progress=plain -t "ghcr.io/wilsonify/stats-with-julia:latest" -f Dockerfile .

docker-test:
	docker run --rm --name stats-with-julia-tester \
	-v $(shell pwd)/src:/usr/src/app/src \
	-v $(shell pwd)/test:/usr/src/app/test \
	-v $(shell pwd)/data:/usr/src/app/data \
	ghcr.io/wilsonify/stats-with-julia-builder:latest julia --project=/usr/src/app /usr/src/app/test/runtests.jl
