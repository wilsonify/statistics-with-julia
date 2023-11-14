using Pkg
path_to_here = @__DIR__
Pkg.activate("$path_to_here")
Pkg.add("PackageCompiler")
Pkg.add("Artifacts")
Pkg.add("Crayons")
Pkg.add("Distributed")
Pkg.add("Example")
Pkg.add("HelloWorldC_jll")
Pkg.add("Random")

