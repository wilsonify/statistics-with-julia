# Estimating elements of a covariance matrix

using DataFrames
using CSV
using Statistics

using .IOLibrary: read_temperatures

function compute_meanVect(data)
    # for Brisbane and Gold Coast as the arrays brisT and gcT respectively.
    brisT = data.Brisbane
    gcT = data.GoldCoast
    # the means of our temperatures are calculated and stored as the array meanVect.
    meanVect = [mean(brisT), mean(gcT)]
    return meanVect
end

function compute_covMat(data)
    brisT = data.Brisbane
    gcT = data.GoldCoast
    # the standard deviations of our temperature observations are calculated
    sigB = std(brisT)
    sigG = std(gcT)
    # the cov() function is used to estimate the covariance.
    covBG = cov(brisT, gcT)
    # the covariance matrix is calculated and assigned to the variable covMat.
    covMat = [sigB^2 covBG
        covBG sigG^2]
    return covMat
end

function compute_mvParams(data)
    mvParams = Dict("meanVect" => compute_meanVect(data),
        "covMat" => compute_covMat(data))
    return mvParams
end

function mvParams_to_string(mvParams_dict)
    return "meanVect = $(mvParams_dict["meanVect"]) \ncovMat = $(mvParams_dict["covMat"])"
end

function write_string_to_file(string_to_write, output_file_path)
    # we save meanVect and covMat to the new Julia file, mvParams.jl.
    # Note that this file is used as input for our calculations in Listing 3.34.
    # the open() function is used (with the argument w) to create the file mvParams.jl in write mode.
    # Note that open() creates an input-output stream, outfile, which can then be written to.

    outfile = open(output_file_path, "w")
    # write() is used to write to the input-output stream outfile.
    write(outfile, string_to_write)
    # the input-output stream outfile is closed.
    close(outfile)
end

function read_mvParams(input_file_path)
    # the content of the file mvParams.jl is printed via the read() and print() functions.
    return read(input_file_path, String)
end

function main_l0412_meanVectCovMatrixSummary()
    path_to_here = @__DIR__
    path_to_data = abspath("$path_to_here/../../data")
    data = read_temperatures("$path_to_data/temperatures.csv")
    # we import the data and store the temperatures
    brisT = data.Brisbane
    gcT = data.GoldCoast
    sigB = std(brisT)
    sigG = std(gcT)
    covBG = cov(brisT, gcT)
    meanVect = [mean(brisT) , mean(gcT)]
    covMat = [sigB^2  covBG
              covBG   sigG^2]
    outfile = open("$path_to_data/mvParams.jl","w")
    write(outfile,"meanVect = $meanVect \ncovMat = $covMat")
    close(outfile)
    print(read("$path_to_data/mvParams.jl", String))
end
if abspath(PROGRAM_FILE) == @__FILE__
    main_l0412_meanVectCovMatrixSummary()
end

export compute_meanVect
export compute_covMat
export compute_mvParams
export mvParams_to_string
export write_string_to_file
export read_mvParams
