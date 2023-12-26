# Searching files in a directory

function directorySearch(directory, searchString)
    # we define the function directorySearch.
    # As arguments, it takes a directory to search through, and a searchString.

    # uses open with “w” to create our output file fileList.txt,which we will write to.
    outfile = open("fileList.txt","w")

    # we create a string array of all filenames in our specified directory that contain our searchString.
    # This string array is defined as the variable fileList.
    # The readdir() function is used to list all files in the given directory, and filter() is used,
    # along with occursin() to check each element contains the searchString.
    fileList = filter(x->occursin(searchString, x), readdir(directory))

    # loop through each element in fileList and print them to theoutput file outfile.
    for file in fileList
        println(outfile, file)
    end

    # closes the IOStream outfile.
    close(outfile)
end

function main_l0431_directorySearch()
    # provides an example of the use of our directorySearch function,
    # where we use it to obtain a shortlist of all files whose extensions contain “.jl” within our current
    # working directory, i.e. pwd().
    directorySearch(@__DIR__,".jl")
end


using Test
@testset "directorySearch" begin
    directorySearch(@__DIR__, ".jl")
end
