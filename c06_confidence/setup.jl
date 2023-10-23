using Pkg
path_to_here = @__DIR__
Pkg.activate("$path_to_here")
Pkg.add("Statistics")
Pkg.add("Random")
Pkg.add("LaTeXStrings")
Pkg.add("Distributions")
Pkg.add("Plots")
Pkg.add("HypothesisTests")
Pkg.add("CategoricalArrays")
Pkg.add("PyPlot")
Pkg.add("Measures")
Pkg.add("DataFrames")
Pkg.add("CSV")