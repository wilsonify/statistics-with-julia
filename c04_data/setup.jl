using Pkg

path_to_here = @__DIR__
Pkg.activate("$path_to_here")
Pkg.add("PyPlot")
Pkg.add("RDatasets")
Pkg.add("Measures")
Pkg.add("DataFrames")
Pkg.add("Distributions")
Pkg.add("Random")
Pkg.add("TimeSeries")
Pkg.add("CategoricalArrays")
Pkg.add("KernelDensity")
Pkg.add("LibPQ")
Pkg.add("CSV")
Pkg.add("Statistics")
Pkg.add("StatsPlots")
Pkg.add("Plots")
Pkg.add("LinearAlgebra")
Pkg.add("StatsBase")
Pkg.add("Dates")
Pkg.precompile()