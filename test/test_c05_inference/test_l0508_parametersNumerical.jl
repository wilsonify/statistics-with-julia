using Random, Distributions, NLsolve
Random.seed!(0)

function m_k(k, data)
    n = length(data)
    return 1 / n * sum(data .^ k)
end

function sim_mHats(samples)
    return [m_k(i, samples) for i in 1:3]
end

function generate_data(a, b, c, n)
    dist = TriangularDist(a, b, c)
    return rand(dist, n)
end

function equations(F, x, mHats)
    F[1] = 1 / 3 * ( x[1] + x[2] + x[3] ) - mHats[1]
    F[2] = 1 / 6 * ( x[1]^2 + x[2]^2 + x[3]^2 + x[1] * x[2] + x[1] * x[3] + x[2] * x[3] ) - mHats[2]
    F[3] = 1 / 10 * ( x[1]^3 + x[2]^3 + x[3]^3 + x[1]^2 * x[2] + x[1]^2 * x[3] + x[2]^2 * x[1] + x[2]^2 * x[3] + x[3]^2 * x[1] + x[3]^2 * x[2] + x[1] * x[2] * x[3] ) - mHats[3]
end

function main_parameters_numerical()
    a, b, c = 3, 5, 4
    n = 2000
    samples = generate_data(a, b, c, n)
    mHats = sim_mHats(samples)
    result = nlsolve((F, x) -> equations!(F, x, mHats), [0.1, 0.1, 0.1])
    sol = sort(result.zero)
    return sol
end

using Test, Random, Distributions, NLsolve

@testset "m_k" begin
    Random.seed!(0)
    data = [1.0, 2.0, 3.0, 4.0, 5.0]
    result = m_k(2, data)
    @test round(result,digits = 2) == 11.0
end

@testset "sim_mHats" begin
    Random.seed!(0)
    samples = [1.0, 2.0, 3.0, 4.0, 5.0]
    result = sim_mHats(samples)
    result = round.(result,digits = 2)
    @test result == [3.0, 11.0, 45.0]
end

@testset "generate_data" begin
    Random.seed!(0)
    a, b, c, n = 3, 5, 4, 1000
    samples = generate_data(a, b, c, n)
    @test length(samples) == n
end

@testset "equations!" begin
    Random.seed!(0)
    x = [1.0, 2.0, 3.0]
    mHats = [3.0, 7.0, 18.7]
    F = similar(x)
    equations!(F, x, mHats)
    result = round.(F,digits=2)
    @test result == [-1.0, 1.33, 14.9]
end

@testset "end_to_end" begin
    Random.seed!(0)
    sol = main()
    @test round(sol[1], digits = 2) == 2.47
    @test round(sol[3], digits = 2) == 2.61
    @test round(sol[2], digits = 2) == 2.61
end