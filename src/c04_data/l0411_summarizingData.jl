# Summary statistics
using CSV
using Statistics
using StatsBase
using DataFrames

using .IOLibrary: read_temperatures_subset

function main_l0411_summarizingData()
    path_to_here = @__DIR__
    path_to_data = abspath("$path_to_here/../../data")
    # we load the data and select the fourth column.

    data = read_temperatures_subset("$path_to_data/temperatures.csv")

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

if abspath(PROGRAM_FILE) == @__FILE__
    main_l0411_summarizingData()
end