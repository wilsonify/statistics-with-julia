

using Test
using Distributions
using c05_inference: myT
using c05_inference: compute_mcQuantile
using c05_inference: compute_analyticQuantile

@testset "myT test" begin
    result = myT(3)
    result = round(result, digits=2)
    @test typeof(result)==Float64
end

@testset "compute_mcQuantile test" begin
    mcQuantile = compute_mcQuantile(10^3, 3, 0.05)
    mcQuantile = round(mcQuantile,digits=2)
    @test typeof(mcQuantile)==Float64
end

@testset "compute_analyticQuantile test" begin
    analyticQuantile = compute_analyticQuantile(3,0.05)
    @test typeof(analyticQuantile)==Float64
end

@testset "end-to-end" begin
    mcQuantile = compute_mcQuantile(20000, 3, 0.05)
    println("Quantile from Monte Carlo: ", mcQuantile)
    analyticQuantile = compute_analyticQuantile(3, 0.05)
    println("Analytic qunatile: ", analyticQuantile)
    @test isapprox(mcQuantile,analyticQuantile,atol=0.1)
end
