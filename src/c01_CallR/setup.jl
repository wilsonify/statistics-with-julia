using Pkg
path_to_here = @__DIR__
Pkg.activate("$path_to_here")
Pkg.add("RCall")
Pkg.precompile()
