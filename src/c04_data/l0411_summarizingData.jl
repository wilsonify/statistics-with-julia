# Summary statistics
using CSV
using Statistics
using StatsBase
using DataFrames

include("$(@__DIR__)/../io_library/read_temperatures.jl")

function main_l0411_summarizingData()
    path_to_here = @__DIR__
    path_to_data = abspath("$path_to_here/../../data")
    # we load the data and select the fourth column.
    # This sets data to be an array of Float64.
    data = read_temperatures("$path_to_data/temperatures.csv")

    # we compute and print the sample mean using mean().
    println("Sample Mean: ", mean(data))
    # We then compare it to the harmonic mean and geometric mean,
    println("Harmonic <= Geometric <= Arithmetic ", (harmmean(data), geomean(data), mean(data)))
    # we compute the sample variance using var() and,
    println("Sample Variance: ",var(data))
    # the sample standard deviation via std().
    println("Sample Standard Deviation: ",std(data))
    # we compute different statistics associated with order statistics
    # including the min, max, median, and quartiles.
    println("Minimum: ", minimum(data))
    println("Maximum: ", maximum(data))
    println("Median: ", median(data))
    println("95th percentile: ", percentile(data, 95))
    println("0.95 quantile: ", quantile(data, 0.95))
    println("Interquartile range: ", iqr(data),"\n")
    # we use the summarystats() function which yields similar output.
    summarystats(data)
end
