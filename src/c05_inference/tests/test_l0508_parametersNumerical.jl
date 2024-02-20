using Test
using Random
using Distributions
using NLsolve
using c05_inference: sim_mHats
using c05_inference: generate_data
using c05_inference: m_k
using c05_inference: equations!

@testset "m_k" begin


    data = [1.0, 2.0, 3.0, 4.0, 5.0]
    result = m_k(2, data)
    @test round(result,digits = 2) == 11.0
end

@testset "sim_mHats" begin


    samples = [1.0, 2.0, 3.0, 4.0, 5.0]
    result = sim_mHats(samples)
    result = round.(result,digits = 2)
    @test result == [3.0, 11.0, 45.0]
end

@testset "generate_data" begin


    a, b, c, n = 3, 5, 4, 1000
    samples = generate_data(a, b, c, n)
    @test length(samples) == n
end

@testset "equations!" begin

    x = [1.0, 2.0, 3.0]
    mHats = [3.0, 7.0, 18.7]
    F = similar(x)
    equations!(F, x, mHats)
    result = round.(F,digits=2)
    @test length(result) == 3
end