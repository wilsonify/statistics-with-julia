
Following steps from 

https://julialang.github.io/PackageCompiler.jl/dev/devdocs/sysimages_part_1.html#man-tutorial-sysimage
https://julialang.github.io/PackageCompiler.jl/dev/devdocs/binaries_part_2.html


# Creating and using a custom sysimage is done in three steps:

1. Start Julia with the --output-o=sys.o custom_sysimage.jl where custom_sysimage.jl is a file that creates the state that we want the sysimage to contain and sys.o is the resulting object file that we will turn into a sysimage.
2. Create a shared library from the object file by linking it with libjulia. This is the actual sysimage.
3. Use the custom sysimage in Julia with the -Jpath/to/sysimage (or the longer, more descriptive --sysimage) flag.