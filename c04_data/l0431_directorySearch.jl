function directorySearch(directory, searchString)
    outfile  = open("fileList.txt","w")
    fileList = filter(x->occursin(searchString, x), readdir(directory))

    for file in fileList
        println(outfile, file)
    end
    close(outfile)
end

directorySearch(@__DIR__,".jl")
