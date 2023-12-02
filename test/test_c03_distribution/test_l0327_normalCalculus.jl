# Numerical derivatives of the normal density
using StatisticsWithJulia: PhiA
using StatisticsWithJulia: PhiB
using StatisticsWithJulia: normalDensity
using Distributions, Calculus, SpecialFunctions, Plots
using LaTeXStrings
using Test

@testset "two CDF implementations" begin
    xGrid = -5:0.01:5
    @test isapprox(maximum(PhiA.(xGrid)),maximum(PhiB.(xGrid)),atol = 0.01)
end

@testset "normalDensity" begin
    xGrid = -5:0.01:5
    println("Maximum difference between two CDF implementations: ", maximum(PhiA.(xGrid) - PhiB.(xGrid)))
    d0 = normalDensity.(xGrid)
end

@testset "derivatives" begin
    xGrid = -5:0.01:5
    println("Maximum difference between two CDF implementations: ", maximum(PhiA.(xGrid) - PhiB.(xGrid)))
    d0 = normalDensity.(xGrid)
    d1 = derivative.(normalDensity,xGrid)
    d2 = second_derivative.(normalDensity, xGrid)
end

@testset "end_to_end" begin
    xGrid = -5:0.01:5
    println("Maximum difference between two CDF implementations: ", maximum(PhiA.(xGrid) - PhiB.(xGrid)))
    d0 = normalDensity.(xGrid)
    d1 = derivative.(normalDensity,xGrid)
    d2 = second_derivative.(normalDensity, xGrid)
    plot(xGrid, [d0 d1 d2], c = [:blue :red :green],label = [L"f(x)" L"f'(x)" L"f''(x)"])
    plot!([-5, 5],[0, 0],  color = :black, lw = 0.5, xlabel = "x", xlims = (-5,5), label = "")
end