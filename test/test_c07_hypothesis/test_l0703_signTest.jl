using CSV, Distributions, HypothesisTests, DataFrames
path_to_here=@__DIR__
path_to_data = abspath("$path_to_here/../../data")

using Test
@testset "end_to_end" begin
data = CSV.read("$path_to_data/machine1.csv", DataFrame, header=false)[:,1]
n = length(data)
mu0A, mu0B = 52.2, 53

xPositiveA = sum(data .> mu0A)
testStatisticA = max(xPositiveA, n-xPositiveA)

xPositiveB = sum(data .> mu0B)
testStatisticB = max(xPositiveB, n-xPositiveB)

binom = Binomial(n,0.5)
pValA = 2*ccdf(binom, testStatisticA)
pValB = 2*ccdf(binom, testStatisticB)

println("Binomial mean: ", mean(binom))

println("Case A: mu0: ", mu0A)
println("\tTest statistc: ", testStatisticA)
println("\tP-value: ", pValA)

println("Case B: mu0: ", mu0B)
println("\tTest statistc: ", testStatisticB)
println("\tP-value: ", pValB)
end