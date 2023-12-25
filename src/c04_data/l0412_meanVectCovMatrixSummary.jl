# Estimating elements of a covariance matrix
#=
In lines 3–5,
we import the data and store the temperatures
for Brisbane and Gold Coast as the arrays brisT and gcT respectively.
In lines 7–8,
the standard deviations of our temperature observations are calculated,
and in line 9
the cov() function is used to estimate the covariance.
In line 11,
the means of our temperatures are calculated and stored as the array meanVect.
In lines 12–13,
the covariance matrix is calculated and assigned to the variable covMat.
In lines 15–17,
we save meanVect and covMat to the new Julia file, mvParams.jl.
Note that this file is used as input for our calculations in Listing 3.34.
First, in line 15, the open() function is used (with the argument w) to create the file
mvParams.jl in write mode.
Note that open() creates an input-output stream, outfile, which can then be written to.
Then in line 16 write() is used to write to the input-output stream outfile.
In line 17, the input-output stream outfile is closed.
In line 18, the content of the file mvParams.jl
is printed via the read() and print() functions.
=#
using DataFrames
using CSV
using Statistics
function main_l0412_meanVectCovMatrixSummary()
    path_to_here = @__DIR__
    path_to_data = abspath("$path_to_here/../../data")

    data = CSV.read("$path_to_data/temperatures.csv", DataFrame, copycols = true)
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

using DataFrames, CSV, Statistics
path_to_here = @__DIR__
include("$path_to_here/../t01_testing/t01_are_dataframes_equal.jl")
include("$path_to_here/../t01_testing/t02_are_lists_equal.jl")
include("$path_to_here/../t01_testing/t04_dataframe_to_dict.jl")

path_to_data = abspath("$path_to_here/../../data")
read_temperatures() = CSV.read("$path_to_data/temperatures.csv", DataFrame, copycols = true)

function compute_meanVect(data)
    brisT = data.Brisbane
    gcT = data.GoldCoast
    meanVect = [mean(brisT), mean(gcT)]
    return meanVect
end

function compute_covMat(data)
    brisT = data.Brisbane
    gcT = data.GoldCoast
    sigB = std(brisT)
    sigG = std(gcT)
    covBG = cov(brisT, gcT)
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
    outfile = open(output_file_path, "w")
    write(outfile, string_to_write)
    close(outfile)
end

function read_mvParams(input_file_path)
    return read(input_file_path, String)
end

using Test
@testset "read_temperatures test" begin
    df = read_temperatures()
    expected_data = DataFrame(Dict{Symbol, Array{Any, 1}}(:Year => [2015, 2015, 2015],
        :Day => [1, 2, 3],
        :GoldCoast => [30.9, 30.1, 30.1],
        :Brisbane => [31.3, 30.5, 28.9],
        :Month => [1, 1, 1]))
    @test dataframe_to_dict(first(df, 3)) == dataframe_to_dict(expected_data)
end

@testset "compute_meanVect test" begin
    df = read_temperatures()
    meanVect = compute_meanVect(df)
    meanVect = round.(meanVect, digits = 2)
    @test meanVect == [27.16, 26.16]
end

@testset "compute_covMat test" begin
    df = read_temperatures()
    covMat = compute_covMat(df)
    covMat = round.(covMat, digits = 2)
    @test covMat == [16.13 13.05; 13.05 12.37]
end

@testset "compute_mvParams test" begin
    df = read_temperatures()
    mvParams = compute_mvParams(df)
    expected_dict = Dict{String, Array{Float64, N} where N}("meanVect" => [
            27.155405405405407,
            26.163835263835264,
        ],
        "covMat" => [16.1253895583728 13.046961200891614; 13.046961200891614 12.367253570765163])
    @test mvParams == expected_dict
end

@testset "mvParams_to_string test" begin
    df = read_temperatures()
    mvParams = compute_mvParams(df)
    mvParams_str = mvParams_to_string(mvParams)
    @test mvParams_str ==
          "meanVect = [27.155405405405407, 26.163835263835264] \ncovMat = [16.1253895583728 13.046961200891614; 13.046961200891614 12.367253570765163]"
end

@testset "write_string_to_file test" begin
    df = read_temperatures()
    mvParams = compute_mvParams(df)
    mvParams_str = mvParams_to_string(mvParams)
    write_string_to_file(mvParams_str, "$path_to_data/mvParams.txt")
    read_string_from_file = read_mvParams("$path_to_data/mvParams.txt")
    @test read_string_from_file ==
          "meanVect = [27.155405405405407, 26.163835263835264] \ncovMat = [16.1253895583728 13.046961200891614; 13.046961200891614 12.367253570765163]"
end
