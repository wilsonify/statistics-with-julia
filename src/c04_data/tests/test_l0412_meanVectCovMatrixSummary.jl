
using DataFrames
using CSV
using Statistics
using Test
using c04_data: compute_meanVect
using c04_data: compute_covMat
using c04_data: compute_mvParams
using c04_data: mvParams_to_string
using c04_data: write_string_to_file
using c04_data: read_mvParams
using testing_library: dataframe_to_dict
using io_library: read_temperatures


path_to_data = abspath("$(@__DIR__)/../../../data")

@testset "read_temperatures test" begin
    df = read_temperatures("$path_to_data/temperatures.csv")
    expected_data = DataFrame(Dict{Symbol, Array{Any, 1}}(:Year => [2015, 2015, 2015],
        :Day => [1, 2, 3],
        :GoldCoast => [30.9, 30.1, 30.1],
        :Brisbane => [31.3, 30.5, 28.9],
        :Month => [1, 1, 1]))
    @test dataframe_to_dict(first(df, 3)) == dataframe_to_dict(expected_data)
end

@testset "compute_meanVect test" begin
    df = read_temperatures("$path_to_data/temperatures.csv")
    meanVect = compute_meanVect(df)
    meanVect = round.(meanVect, digits = 2)
    @test meanVect == [27.16, 26.16]
end

@testset "compute_covMat test" begin
    df = read_temperatures("$path_to_data/temperatures.csv")
    covMat = compute_covMat(df)
    covMat = round.(covMat, digits = 2)
    @test covMat == [16.13 13.05; 13.05 12.37]
end

@testset "compute_mvParams test" begin
    df = read_temperatures("$path_to_data/temperatures.csv")
    mvParams = compute_mvParams(df)
    expected_dict = Dict{String, Array{Float64, N} where N}("meanVect" => [
                27.16,                26.16,        ],
        "covMat" => [16.13 13.05; 13.05 12.37])

    # Compare mean vector
    @test mvParams["meanVect"] ≈ expected_dict["meanVect"] atol=0.01

    # Compare covariance matrix
    @test isapprox(mvParams["covMat"], expected_dict["covMat"], atol=0.01)
end


@testset "mvParams_to_string test" begin
    df = read_temperatures("$path_to_data/temperatures.csv")
    mvParams = compute_mvParams(df)
    mvParams_str = mvParams_to_string(mvParams)
    @test typeof(mvParams_str) == String
end

@testset "write_string_to_file test" begin
    df = read_temperatures("$path_to_data/temperatures.csv")
    mvParams = compute_mvParams(df)
    mvParams_str = mvParams_to_string(mvParams)
    write_string_to_file(mvParams_str, "$path_to_data/mvParams.txt")
    read_string_from_file = read_mvParams("$path_to_data/mvParams.txt")
    @test typeof(read_string_from_file) == String
end
