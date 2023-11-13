using Pkg
path_to_here = @__DIR__
Pkg.add("BSON")
Pkg.add("Calculus")
Pkg.add("CategoricalArrays")
Pkg.add("ChainRules")
Pkg.add("Clustering")
Pkg.add("Combinatorics")
Pkg.add("CSV")
Pkg.add("DataFrames")
Pkg.add("DataStructures")
Pkg.add("Dates")
Pkg.add("DecisionTree")
Pkg.add("DiffEqBase")
Pkg.add("DifferentialEquations")
Pkg.add("Distributions")
Pkg.add("Flux")
Pkg.add("GLM")
Pkg.add("HCubature")
Pkg.add("HTTP")
Pkg.add("HypothesisTests")
Pkg.add("ImageMagick")
Pkg.add("Images")
Pkg.add("JSON")
Pkg.add("JuliaFormatter")
Pkg.add("KernelDensity")
Pkg.add("LaTeXStrings")
Pkg.add("LibPQ")
Pkg.add("LIBSVM")
Pkg.add("LightGraphs")
Pkg.add("LinearAlgebra")
Pkg.add("Measures")
Pkg.add("MLDatasets")
Pkg.add("MultivariatePolynomials")
Pkg.add("MultivariateStats")
Pkg.add("MutableArithmetics")
Pkg.add("NLsolve")
Pkg.add("PackageCompiler")
Pkg.add("Plots")
Pkg.add("QuadGK")
Pkg.add("Random")
Pkg.add("Roots")
Pkg.add("SafeTestsets")
Pkg.add("SpecialFunctions")
Pkg.add("Statistics")
Pkg.add("StatsBase")
Pkg.add("StatsPlots")
Pkg.add("TimeSeries")
Pkg.add("Zygote")
Pkg.add("RCall")
Pkg.add("RDatasets")
Pkg.add("PyCall")
Pkg.build("PyCall")
Pkg.add("PyPlot")
