using Pkg
path_to_here = @__DIR__
Pkg.activate("$path_to_here")
Pkg.add("KernelDensity")
Pkg.add("Random")
Pkg.add("Distributions")
Pkg.add("StatsBase")
Pkg.add("HypothesisTests")
Pkg.add("GLM")
Pkg.add("PyPlot")
Pkg.add("DataFrames")
Pkg.add("CSV")
Pkg.add("CategoricalArrays")
