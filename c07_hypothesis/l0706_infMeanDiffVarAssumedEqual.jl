using CSV, Distributions, HypothesisTests, DataFrames
path_to_here=@__DIR__
path_to_data = abspath("$path_to_here/../data")
data1 = CSV.read("$path_to_data/machine1.csv", DataFrame,header=false, allowmissing=:none)[:,1]
data2 = CSV.read("$path_to_data/machine2.csv", DataFrame, header=false, allowmissing=:none)[:,1]
xBar1, s1, n1 = mean(data1), std(data1), length(data1)
xBar2, s2, n2 = mean(data2), std(data2), length(data2)
delta0 = 0

sP = sqrt( ( (n1-1)*s1^2 + (n2-1)*s2^2 ) / (n1 + n2 - 2) )
testStatistic = ( xBar1-xBar2 - delta0 ) / ( sP * sqrt( 1/n1 + 1/n2) )
pVal = 2*ccdf(TDist(n1+n2 -2), abs(testStatistic))

println("Manually calculated test statistc: ", testStatistic)
println("Manually calculated p-value: ", pVal)
println(EqualVarianceTTest(data1, data2, delta0))
