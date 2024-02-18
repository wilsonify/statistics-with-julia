
using StatisticsWithJulia.c02_probability: estimate_pA_modelI
using StatisticsWithJulia.c02_probability: estimate_pA_modelIIest
using StatisticsWithJulia.c02_probability: plotLatticePaths
using Test
using Random
Random.seed!(12)

# Test the functions
@testset "Lattice Paths Simulation Tests" begin
    n, N = 5, 100
    pA_modelI = estimate_pA_modelI(n)
    pA_modelIIest = estimate_pA_modelIIest(n, N)
    @test pA_modelI >= 0.0
    @test pA_modelI <= 1.0
    @test pA_modelIIest >= 0.0
    @test pA_modelIIest <= 1.0
end

# Test the plotLatticePaths function (manual inspection)
@testset "Test plotLatticePaths function" begin
    n = 5
    plotLatticePaths(n)
    # Manual inspection for plotting function
    @test true
end
