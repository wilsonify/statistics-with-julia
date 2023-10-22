function lineSearch(inputFilename, outputFilename, keyword)
    infile  = open(inputFilename, "r")
    outfile = open(outputFilename,"w")

    for (index, line) in enumerate(split(read(infile, String), "\n"))
        if occursin(keyword, line)
            println(outfile, "$index: $line")
        end
    end
    close(infile)
    close(outfile)
end

path_to_here=@__DIR__
path_to_data = abspath("$path_to_here/../data")

lineSearch("$path_to_data/earth.txt", "$path_to_data/waterLines.txt", "water")