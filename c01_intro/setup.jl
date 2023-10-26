using Pkg
path_to_here = @__DIR__
Pkg.activate("$path_to_here")
ENV["PYTHON"] = "/home/thom/venvs/venv310/bin/python"
Pkg.add("CSV")
Pkg.add("DataFrames")
Pkg.add("HTTP")
Pkg.add("Images")
Pkg.add("JSON")
Pkg.add("LaTeXStrings")
Pkg.add("Measures")
Pkg.add("Plots")
Pkg.add("PyCall")
Pkg.add("PyPlot")
Pkg.add("RCall")
Pkg.add("Roots")
Pkg.add("StatsBase")

Pkg.build("PyCall")