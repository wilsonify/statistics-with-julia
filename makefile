
base:
	docker build --progress=plain -t "ghcr.io/wilsonify/stats-with-julia-base:latest" -f Dockerfile-base .

builder:
	docker build --progress=plain -t "ghcr.io/wilsonify/stats-with-julia-builder:latest" -f Dockerfile-builder .

image:
	docker build --progress=plain -t "ghcr.io/wilsonify/stats-with-julia:latest" -f Dockerfile .

docker-test1:
	docker run --rm --name stats-with-julia-tester ghcr.io/wilsonify/stats-with-julia:latest julia --project=~/.julia/environments/v1.9 /usr/src/app/test/runtests.jl

docker-test2:
	docker run --rm --name stats-with-julia-tester \
	-v $(shell pwd)/src:/usr/src/app/src \
	-v $(shell pwd)/test:/usr/src/app/test \
	-v $(shell pwd)/data:/usr/src/app/data \
	ghcr.io/wilsonify/stats-with-julia-builder:latest julia --project=/usr/src/app /usr/src/app/test/runtests.jl

docker-test3:
	docker run --rm --name stats-with-julia-tester \
	-v $(shell pwd)/src:/usr/src/app/src \
	-v $(shell pwd)/test:/usr/src/app/test \
	-v $(shell pwd)/data:/usr/src/app/data \
	ghcr.io/wilsonify/stats-with-julia-builder:latest julia --project=/usr/src/app /usr/src/app/test/test_c04_data/test_l0404_dataframeReferencing.jl


/home/thom/.julia/environments/v1.4/Project.toml:
	/opt/julia/v1.4.2/bin/julia --project=~/.julia/environments/v1.4 setup.jl

test1.4:
	/opt/julia/v1.4.2/bin/julia --project=~/.julia/environments/v1.4 test/runtests.jl

/home/thom/.julia/environments/v1.5/Project.toml:
	/opt/julia/v1.5.4/bin/julia --project=~/.julia/environments/v1.5 setup.jl

test1.5:
	/opt/julia/v1.5.4/bin/julia --project=~/.julia/environments/v1.5 test/runtests.jl

/home/thom/.julia/environments/v1.6/Project.toml:
	/opt/julia/v1.6.7/bin/julia --project=~/.julia/environments/v1.6 setup.jl

test1.6:
	/opt/julia/v1.6.7/bin/julia --project=~/.julia/environments/v1.6 test/runtests.jl

/home/thom/.julia/environments/v1.7/Project.toml:
	/opt/julia/v1.7.3/bin/julia --project=~/.julia/environments/v1.7 setup.jl

test1.7:
	/opt/julia/v1.7.3/bin/julia --project=~/.julia/environments/v1.7 test/runtests.jl

/home/thom/.julia/environments/v1.8/Project.toml:
	/opt/julia/v1.8.5/bin/julia --project=~/.julia/environments/v1.8 setup.jl

test1.8:
	/opt/julia/v1.8.5/bin/julia --project=~/.julia/environments/v1.8 test/runtests.jl

/home/thom/.julia/environments/v1.9/Project.toml:
	/opt/julia/v1.9.4/bin/julia --project=~/.julia/environments/v1.9 setup.jl

test1.9:
	/opt/julia/v1.9.4/bin/julia --project=~/.julia/environments/v1.9 test/runtests.jl

test_c04_data1.9:
	/opt/julia/v1.9.4/bin/julia --project=~/.julia/environments/v1.9 test/test_c04_data/runtests.jl


startup:
	mkdir ~/.julia/config && cp startup.jl ~/.julia/config