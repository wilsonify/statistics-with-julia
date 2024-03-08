#=

=#
using CSV, Distributions, HypothesisTests, DataFrames
path_to_here=@__DIR__
path_to_data = abspath("$path_to_here/../../data")
data = CSV.read("$path_to_data/machine1.csv", DataFrame, header=false)[:,1]
xBar, n = mean(data), length(data)
s = std(data)
mu0 = 52.2

testStatistic = ( xBar - mu0 ) / ( s/sqrt(n) )
pVal = 2*ccdf(TDist(n-1), abs(testStatistic))

println("Manually calculated test statistic: ", testStatistic)
println("Manually calculated p-value: ", pVal)
OneSampleTTest(data, mu0)
