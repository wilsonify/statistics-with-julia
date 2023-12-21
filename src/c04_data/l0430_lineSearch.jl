# Filtering an input file
#=
In lines 1–12,
the function lineSearch() is defined,
which searches an input file,
inputFilename, for a keyword,
and saves the lines and line numbers where it appears to an output file, outputFilename.
Line 2 uses open() with “r” to open the file to be searched in read mode.
It creates an IOStream object,
which can be used as arguments to other functions.
We define this as the variable infile.
Line 3 uses open() with “w” to create and open a file in write mode,
with the given file name outputFilename.
This file is created on disk ready to have information written to it.
Lines 5–9 contain a for loop,
which is used to search through the input file for the given keyword.
Line 5 reads the file as a String via read(),
and split() is used along with “\n” to convert the single string into an array of strings,
where the content of each line is stored in a separate index of the array.
Line 6 uses occursin() to check if the given line contains our given keyword.
If it does, then we proceed to line 7, where println() is used to write both the index and the line content
to the outfile.
Lines 10 and 11 close both our input file and output file.
In line 14 lineSearch is used to search the file “earth.txt”, for the keyword “water”,
with the line numbers and text saved to the file waterLines.txt”.

=#
function lineSearch(inputFilename, outputFilename, keyword)
    infile = open(inputFilename, "r")
    outfile = open(outputFilename,"w")

    for (index, line) in enumerate(split(read(infile, String), "\n"))
        if occursin(keyword, line)
            println(outfile, "$index: $line")
        end
    end
    close(infile)
    close(outfile)
end

path_to_here = @__DIR__
path_to_data = abspath("$path_to_here/../../data")

lineSearch("$path_to_data/earth.txt", "$path_to_data/waterLines.txt", "water")


function lineSearch(inputFilename, outputFilename, keyword)
    infile = open(inputFilename, "r")
    outfile = open(outputFilename, "w")

    for (index, line) in enumerate(split(read(infile, String), "\n"))
        if occursin(keyword, line)
            println(outfile, "$index: $line")
        end
    end
    close(infile)
    close(outfile)
end

using Test
@testset "lineSearch test" begin
    path_to_here = @__DIR__
    path_to_data = abspath("$path_to_here/../../data")
    lineSearch("$path_to_data/earth.txt", "$path_to_data/waterLines.txt", "water")
end
