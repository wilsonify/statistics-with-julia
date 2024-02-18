using Test
@testset "TriangularDist" begin
    Random.seed!(1)
    dist1 = TriangularDist(0,10,5)
    theorMean1 = mean(dist1)
    N = 10^6
    data1 = rand(dist1,N)
    estMean1 = mean(data1)
    @test isapprox(theorMean1,estMean1,atol=0.01)
end
@testset "DiscreteUniform" begin
    Random.seed!(1)
    dist2 = DiscreteUniform(1,5)
    theorMean2 = mean(dist2)
    N = 10^6
    data2 = rand(dist2,N)
    estMean2 = mean(data2)
    @test isapprox(theorMean2,estMean2,atol=0.01)
end