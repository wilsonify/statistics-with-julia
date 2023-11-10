using Pkg
path_to_here = @__DIR__
Pkg.activate("$path_to_here")
ENV["JULIA_FFMPEG"] = "/usr/bin/ffmpeg"
Pkg.add("CSV")
Pkg.add("DataFrames")
Pkg.add("HTTP")
Pkg.add("Images")
Pkg.add("JSON")
Pkg.add("LaTeXStrings")
Pkg.add("Measures")
Pkg.add("Plots")
Pkg.add("RCall")
Pkg.add("Roots")
Pkg.add("StatsBase")
Pkg.add("SafeTestsets")
Pkg.add("ImageMagick")
Pkg.add("FFMPEG")
Pkg.precompile()