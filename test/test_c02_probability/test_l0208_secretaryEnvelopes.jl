# Secretary with envelopes
using Random, StatsBase, Combinatorics
Random.seed!(1)

function bruteSetsProbabilityAllMiss(n)
    omega = collect(permutations(1:n))
    matchEvents = []
    for i in 1:n
        event = []
        for p in omega
            if p[i] == i
                push!(event,p)
            end
        end
        push!(matchEvents,event)
    end
    noMatch = setdiff(omega,union(matchEvents...))
    return length(noMatch) / length(omega)
end

formulaCalcAllMiss(n) = sum([(-1)^k / factorial(k) for k in 0:n])

function mcAllMiss(n, N)
    function envelopeStuffer()
        envelopes = Random.shuffle!(collect(1:n))
        return sum([envelopes[i] == i for i in 1:n]) == 0
    end
    data = [envelopeStuffer() for _ in 1:N]
    return sum(data) / N
end

function main_secretary_envelopes()
    N = 10^6

    println("n\tBrute Force\tFormula\t\tMonte Carlo\tAsymptotic",)
    for n in 1:6
        bruteForce = bruteSetsProbabilityAllMiss(n)
        fromFormula = formulaCalcAllMiss(n)
        fromMC = mcAllMiss(n,N)
        println(n,"\t",round(bruteForce,digits = 4),"\t\t",round(fromFormula,digits = 4),    "\t\t",round(fromMC,digits = 4),"\t\t",round(1 / MathConstants.e,digits = 4))
    end
end

using Test

using Test

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


