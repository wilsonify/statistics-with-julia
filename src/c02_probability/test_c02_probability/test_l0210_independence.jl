using StatisticsWithJulia: simulation_independent_events

using Test
using Random
Random.seed!(1)

@testset "test_independent_events" begin
    Random.seed!(12)
    probThirteen, probFirstIsOne, probSecondIsThree = simulation_independent_events(10^7)
    @test isapprox(probThirteen, 0.0625, atol=0.01)
    @test isapprox(probFirstIsOne, 0.625, atol=0.01)
    @test isapprox(probSecondIsThree, 0.125, atol=0.01)
    @test isapprox(probFirstIsOne * probSecondIsThree, 0.0781, atol=0.01)
end


