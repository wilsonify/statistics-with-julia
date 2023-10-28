using CSV, Statistics, StatsBase, DataFrames
path_to_here = @__DIR__
path_to_data = abspath("$path_to_here/../data")

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