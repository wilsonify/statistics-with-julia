# Filtering an input file

function lineSearch(inputFilename, outputFilename, keyword)
    # searches an input file,  inputFilename, for a keyword,
    # and saves the lines and line numbers where it appears to an output file, outputFilename.

    # uses open() with “r” to open the file to be searched in read mode.
    # It creates an IOStream object, which can be used as arguments to other functions.
    infile = open(inputFilename, "r")

    # uses open() with “w” to create and open a file in write mode,with the given file name outputFilename.
    # This file is created on disk ready to have information written to it.
    outfile = open(outputFilename,"w")

    # a for loop is used to search through the input file for the given keyword.
    # reads the file as a String via read(),
    # and split() is used along with “\n” to convert the single string into an array of strings,
    # where the content of each line is stored in a separate index of the array.
    for (index, line) in enumerate(split(read(infile, String), "\n"))
        # check if the given line contains our given keyword.
        if occursin(keyword, line)
            # If it does, then we proceed to line 7, where println() is used to write both the index and the line content to the outfile.
            println(outfile, "$index: $line")
        end
    end
    # close both our input file and output file.
    close(infile)
    close(outfile)
end

function main_l0430_lineSearch()
    path_to_here = @__DIR__
    path_to_data = abspath("$path_to_here/../../data")
    # lineSearch is used to search the file “earth.txt”, for the keyword “water”,
    # with the line numbers and text saved to the file waterLines.txt”.
    lineSearch("$path_to_data/earth.txt", "$path_to_data/waterLines.txt", "water")
end


