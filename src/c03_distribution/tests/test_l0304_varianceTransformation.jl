# Variance of X as the mean of Y
using c03_distribution: variance_transform
using Distributions, Plots; gr()
using Test
@testset "end_to_end" begin
    dist = TriangularDist(4,6,5)
    N = 10^6
    data = rand(dist,N)
    yData = variance_transform(data)
    @test isapprox(mean(yData),var(data),atol=0.001)
end