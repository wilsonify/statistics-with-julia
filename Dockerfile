FROM ghcr.io/wilsonify/stats-with-julia-builder:latest as builder
COPY . /usr/src/app
WORKDIR /usr/src/app
RUN julia --project=~/.julia/environments/v1.10 dev.jl
RUN julia --project=~/.julia/environments/v1.10 -e "import Pkg; Pkg.instantiate()"
ENTRYPOINT ["julia", "--project=~/.julia/environments/v1.9"]
CMD ["runtests.jl"]
#RUN julia --project=/usr/src/app build.jl
#FROM stats-with-julia-base:latest
#COPY --from=builder /usr/src/app/dist/sysimage /usr/local/julia/sysimage
#WORKDIR /usr/src/app/dist
#ENTRYPOINT ["julia", "--project=/usr/src/app", "--sysimage=/usr/local/julia/sysimage/sys.so", "server.jl"]
