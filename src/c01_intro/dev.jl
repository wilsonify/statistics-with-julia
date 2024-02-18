using Pkg

if VERSION <= v"1.5"
    println("VERSION v$VERSION < v1.5")
    Pkg.develop(PackageSpec(path="."))
else
    println("VERSION v$VERSION >= v1.5")
    Pkg.develop(path=".")
end