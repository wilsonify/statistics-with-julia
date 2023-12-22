#=
Generate Random Data and Estimate Means
This code generates random data samples from two probability distributions,
a symmetric triangular distribution and
a discrete uniform distribution,
and estimates their means.
It demonstrates how to use Julia's
Distributions and StatsBase libraries to work with
probability distributions and estimate sample means.
=#

using Distributions, StatsBase, Random

function main_l0311_basicDistRand()
    Random.seed!(1)
    dist1 = TriangularDist(0,10,5)
    dist2 = DiscreteUniform(1,5)
    theorMean1 = mean(dist1)
    theorMean2 = mean(dist2)
    N = 10^6
    data1 = rand(dist1,N)
    data2 = rand(dist2,N)
    estMean1 = mean(data1)
    estMean2 = mean(data2)
    println("Symmetric Triangular Distiribution on [0,10] has mean $theorMean1 	(estimated: $estMean1)")
    println("Discrete Uniform Distiribution on {1,2,3,4,5} has mean $theorMean2 	(estimated: $estMean2)")
end




if abspath(PROGRAM_FILE) == @__FILE__
    main_l0311_basicDistRand()
end