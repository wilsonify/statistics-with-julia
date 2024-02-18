
using StatisticsWithJulia.c02_probability: mc_estimate1
using StatisticsWithJulia.c02_probability: mc_estimate2
using StatisticsWithJulia.c02_probability: run_simulations_falacy

using Test
using Random
@testset "mc_estimate1 test" begin
    Random.seed!(1)
    A = Set(['a', 'e', 'i', 'o', 'u'])
    B = Set(['x', 'y', 'z'])
    omega = 'a':'z'
    N = 10^3
    result = mc_estimate1(N,omega,A,B)
    result = round(result,digits = 1)
    @test result == 0.3
end

@testset "mc_estimate2 test" begin
    Random.seed!(1)
    A = Set(['a', 'e', 'i', 'o', 'u'])
    B = Set(['x', 'y', 'z'])
    omega = 'a':'z'
    N = 10^3
    result = mc_estimate2(N,omega,A,B)
    result = round(result,digits = 1)
    @test result == 0.3
end

@testset "run_simulations_falacy test" begin
    Random.seed!(1)
    A = Set(['a', 'e', 'i', 'o', 'u'])
    B = Set(['x', 'y', 'z'])
    omega = 'a':'z'
    run_simulations_falacy(100)
end