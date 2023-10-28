using Pkg
path_to_here = @__DIR__
Pkg.activate("$path_to_here")
Pkg.update()
Pkg.add("DiffEqBase")
Pkg.add("Statistics")
Pkg.add("Random")
Pkg.add("Distributions")
Pkg.add("LightGraphs")
Pkg.add("StatsBase")
Pkg.add("LinearAlgebra")
Pkg.add("PyPlot")
Pkg.add("DifferentialEquations")
Pkg.add("DataStructures")
Pkg.add("Plots")
Pkg.add("MultivariatePolynomials")
Pkg.add("MutableArithmetics")
Pkg.add("Measures")
Pkg.precompile()
