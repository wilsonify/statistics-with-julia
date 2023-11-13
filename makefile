

base:
	docker build --progress=plain -t "stats-with-julia-base:latest" -f Dockerfile-base .

builder:
	docker build --progress=plain -t "stats-with-julia-builder:latest" -f Dockerfile-builder .

image:
	docker build --progress=plain -t "stats-with-julia:latest" -f Dockerfile .

docker-test:
	docker run --rm --name stats-with-julia stats-with-julia:latest julia --project=/usr/src/app /usr/src/app/test/runtests.jl