using Pkg
path_to_here = @__DIR__
Pkg.activate("$path_to_here")
Pkg.add("Statistics")
Pkg.add("Random")
Pkg.add("Distributions")
Pkg.add("LinearAlgebra")
Pkg.add("GLM")
Pkg.add("PyPlot")
Pkg.add("RDatasets")
Pkg.add("PyCall")
Pkg.add("DataFrames")
Pkg.add("CSV")