using Pkg
path_to_here = @__DIR__
Pkg.activate("$path_to_here")
Pkg.add("Statistics")
Pkg.add("Random")
Pkg.add("Distributions")
Pkg.add("LightGraphs")
Pkg.add("StatsBase")
Pkg.add("LinearAlgebra")
Pkg.add("PyPlot")
Pkg.add("DifferentialEquations")
Pkg.add("DataStructures")