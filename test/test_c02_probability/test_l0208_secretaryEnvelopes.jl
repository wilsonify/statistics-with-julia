
using StatisticsWithJulia: bruteSetsProbabilityAllMiss
using StatisticsWithJulia: formulaCalcAllMiss
using StatisticsWithJulia: mcAllMiss
using Test
using Random
Random.seed!(1)

@testset "bruteSetsProbabilityAllMiss Test" begin
    Random.seed!(1)
    result = bruteSetsProbabilityAllMiss(6)
    result = round(result,digits=2)
    @test result==0.37
end

@testset "formulaCalcAllMiss Tests" begin
    Random.seed!(1)
    result = formulaCalcAllMiss(6)
    result = round(result,digits=2)
    @test result==0.37
end

@testset "mcAllMiss Tests" begin
    Random.seed!(1)
    result = mcAllMiss(6, 10^6)
    result = round(result,digits=2)
    @test result==0.37
end


@testset "equality tests" begin
    N = 10^6
    for n in 1:6
        bruteForce = bruteSetsProbabilityAllMiss(n)
        fromFormula = formulaCalcAllMiss(n)
        fromMC = mcAllMiss(n, N)
        @test isapprox(bruteForce, fromFormula, atol = 1e-2)  # Check if bruteForce is close to the expected value from the formula
        @test isapprox(bruteForce, fromMC, atol = 1e-2)  # Check if bruteForce is close to the Monte Carlo estimation
        @test isapprox(fromFormula, fromMC, atol = 1e-2)  # Check if the formula result is close to the Monte Carlo estimation
    end
end


