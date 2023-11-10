using Pkg
Pkg.activate(".")
Pkg.add("PyCall")
ENV["PYTHON"] = "/home/thom/venvs/venv310/bin/python"
Pkg.build("PyCall")