#=
Sample means for ANOVA
=#
using CSV, DataFrames, Statistics
path_to_here=@__DIR__
path_to_data=abspath("$path_to_here/../../data")
rfile(name) = CSV.read(name, DataFrame, header=false)[:,1]
data = rfile.(["$path_to_data/machine1.csv","$path_to_data/machine2.csv","$path_to_data/machine3.csv"])
println("Sample means for each treatment: ",round.(mean.(data),digits=2))
println("Overall sample mean: ",round(mean(vcat(data...)),digits=2))
