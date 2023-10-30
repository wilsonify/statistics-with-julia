using Random, StatsBase
using Test


function mc_estimate1(N, omega, A, B)
     return sum([in(sample(omega),A) || in(sample(omega),B) for _ in 1:N]) / N
end

function mc_estimate2(N, omega, A, B)
     return sum([in(sample(omega),union(A,B)) for _ in 1:N]) / N
end

function run_simulations(nsims)
    N = 1000
    A = Set(['a', 'e', 'i', 'o', 'u'])
    B = Set(['x', 'y', 'z'])
    omega = 'a':'z'
    for _ in 1:nsims
        mcEst1 = mc_estimate1(N,omega,A,B)
        mcEst2 = mc_estimate2(N,omega,A,B)
        println(mcEst1,"\t",mcEst2)
    end
end


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

@testset "run_simulations test" begin
    Random.seed!(1)
    A = Set(['a', 'e', 'i', 'o', 'u'])
    B = Set(['x', 'y', 'z'])
    omega = 'a':'z'
    run_simulations(100)
end