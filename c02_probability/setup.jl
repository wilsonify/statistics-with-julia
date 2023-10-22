using Pkg
path_to_here = @__DIR__
Pkg.activate("$path_to_here")
Pkg.add("Random")
Pkg.add("StatsBase")
Pkg.add("Combinatorics")
Pkg.add("Plots")
Pkg.add("LaTeXStrings")
Pkg.add("SpecialFunctions")
Pkg.add("PyPlot")
