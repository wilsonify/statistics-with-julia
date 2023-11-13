FROM statswithjulia-builder:latest
COPY . /usr/src/app
ENTRYPOINT ["julia", "--project=."]
CMD = ["src/c11_api/generated/server.jl"]