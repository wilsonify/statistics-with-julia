using DataFrames
using CSV
using Statistics
using Dates
using Measures
using Plots; gr()
using Test
path_to_here = @__DIR__
path_to_data = abspath("$path_to_here/../../data")


# Define a test for data reading
@testset "Data Reading Test" begin
    data = CSV.read("$path_to_data/temperatures.csv", DataFrame)
    # Check if the data is not empty
    @test !isempty(data)
    # Check if specific columns exist in the DataFrame (adjust as needed)
    @test hasproperty(data, :Brisbane)
    @test hasproperty(data, :GoldCoast)
end

# Define a test for date conversion
@testset "Date Conversion Test" begin
    data = DataFrame(Year = [2022, 2022],
        Month = [7, 8],
        Day = [1, 15])

    dates = [Date(Year(data.Year[i]), Month(data.Month[i]), Day(data.Day[i])) for i in 1:nrow(data)]

    # Check if the date conversion produces the expected dates
    @test dates == [Date(2022, 7, 1), Date(2022, 8, 15)]
end

# Define a test for data processing
@testset "Data Processing Test" begin
    data = DataFrame(Brisbane = [25.0, 28.0, 30.0],
        GoldCoast = [24.0, 26.0, 29.0])

    diff = data.Brisbane - data.GoldCoast

    # Check if the temperature difference is calculated correctly
    @test diff == [1.0, 2.0, 1.0]
end
