FROM statswithjulia-builder:latest as builder
COPY . /usr/src/app
WORKDIR /usr/src/app/src/c11_api/generated
ENTRYPOINT ["julia", "--project=/usr/src/app"]
CMD = ["server.jl"]

# TODO copy executable into statswithjulia-base
# FROM statswithjulia-base
# COPY from=builder /usr/src/app/dist /usr/src/app/dist
# WORKDIR /usr/src/app/dist
# ENTRYPOINT ["server"]