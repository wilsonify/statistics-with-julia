# Summary statistics

#=
In line 2,
we load the data and select the fourth column.
This sets data to be an array of Float64.
In line 4,
we compute and print the sample mean using mean().
We then compare it to the harmonic mean and geometric mean,
computed via harmmean() and geomean(), respectively.
In line 7,
we compute the sample variance using var() and,
then in line 8,
the sample standard deviation via std().
In lines 9–14,
we compute different statistics associated with order statistics including the min,
max, median, and quartiles.
Finally,  in line 16,
we use the summarystats() function which yields similar output.
=#
using CSV, Statistics, StatsBase, DataFrames
path_to_here = @__DIR__
path_to_data = abspath("$path_to_here/../../data")

data = CSV.read("$path_to_data/temperatures.csv",DataFrame)[:,4]

println("Sample Mean: ", mean(data))
println("Harmonic <= Geometric <= Arithmetic ", 
    (harmmean(data), geomean(data), mean(data)))
println("Sample Variance: ",var(data))
println("Sample Standard Deviation: ",std(data))
println("Minimum: ", minimum(data))
println("Maximum: ", maximum(data))
println("Median: ", median(data))
println("95th percentile: ", percentile(data, 95))
println("0.95 quantile: ", quantile(data, 0.95))
println("Interquartile range: ", iqr(data),"\n")

summarystats(data)

using CSV, Statistics, StatsBase, DataFrames
path_to_here = @__DIR__
include("$path_to_here/t01_are_dataframes_equal.jl")
include("$path_to_here/t02_are_lists_equal.jl")
include("$path_to_here/t04_dataframe_to_dict.jl")

path_to_data = abspath("$path_to_here/../../data")
read_temperatures() = CSV.read("$path_to_data/temperatures.csv", DataFrame)[:, 4]

using Test
@testset "mean test" begin
    data = read_temperatures()
    @test round(mean(data), digits = 2) == 27.16
end

@testset "Harmonic <= Geometric <= Arithmetic test" begin
    data = read_temperatures()
    @test round.((harmmean(data), geomean(data), mean(data)), digits = 2) == (26.52, 26.85, 27.16)
end

@testset "Sample Variance test" begin
    data = read_temperatures()
    @test round(var(data), digits = 2) == 16.13
end

@testset "Sample Standard Deviation test" begin
    data = read_temperatures()
    @test round(std(data), digits = 2) == 4.02
end

@testset "Minimum test" begin
    data = read_temperatures()
    @test round(minimum(data), digits = 2) == 16.10
end

@testset "Maximum test" begin
    data = read_temperatures()
    @test round(maximum(data), digits = 2) == 37.60
end

@testset "Median test" begin
    data = read_temperatures()
    @test round(median(data), digits = 2) == 27.70
end

@testset "95th percentile test" begin
    data = read_temperatures()
    @test round(percentile(data, 95), digits = 2) == 33.00
end

@testset "0.95 quantile test" begin
    data = read_temperatures()
    @test round(quantile(data, 0.95), digits = 2) == 33.00
end

@testset "Interquartile range test" begin
    data = read_temperatures()
    @test round(iqr(data), digits = 2) == 6.10
end

@testset "summarystats test" begin
    df = read_temperatures()
    ss = summarystats(df)
    @test round(ss.mean, digits = 2) == 27.16
    @test round(ss.min, digits = 2) == 16.10
    @test round(ss.q25, digits = 2) == 24.00
    @test round(ss.median, digits = 2) == 27.70
    @test round(ss.q75, digits = 2) == 30.10
    @test round(ss.max, digits = 2) == 37.6
end
