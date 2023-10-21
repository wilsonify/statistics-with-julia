using Pkg
Pkg.activate(".")
Pkg.add("PyCall")
ENV[”PYTHON”] = ”/home/thom/venvs/MLOps-with-MLFlow/bin/python”
Pkg.build("PyCall")