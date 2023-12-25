# Searching files in a directory
#=
In lines 1–9,
we define the function directorySearch.
As arguments, it takes a directory to search through, and a searchString.
Line 2 uses open with “w” to create our output file fileList.txt,
which we will write to.
In line 3,
we create a string array of all filenames in our specified directory that contain our searchString.
This string array is defined as the variable fileList.
The readdir() function is used to list all files in the given directory, and filter() is used,
along with occursin() to check each element contains the searchString.
Lines 5–7 loop through each element in fileList and print them to theoutput file outfile.
Line 8 closes the IOStream outfile.
Line 11 provides an example of the use of our directorySearch function,
where we use it to obtain a shortlist of all files whose extensions contain “.jl” within our current
working directory, i.e. pwd().
=#
function directorySearch(directory, searchString)
    outfile = open("fileList.txt","w")
    fileList = filter(x->occursin(searchString, x), readdir(directory))

    for file in fileList
        println(outfile, file)
    end
    close(outfile)
end

function main_l0431_directorySearch()
    directorySearch(@__DIR__,".jl")
end

function directorySearch(directory, searchString)
    outfile = open("fileList.txt", "w")
    fileList = filter(x -> occursin(searchString, x), readdir(directory))

    for file in fileList
        println(outfile, file)
    end
    close(outfile)
end

using Test
@testset "directorySearch" begin
    directorySearch(@__DIR__, ".jl")
end
