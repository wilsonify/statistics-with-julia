using Pkg
ENV["PYTHON"] = "/usr/bin/python"
Pkg.add("PyCall")
Pkg.build("PyCall")