# CDF from the Riemann sum of a PDF
using StatisticsWithJulia.c03_distribution: approximate_CDF
using LaTeXStrings
using Plots; gr()
using Test

@testset "end_to_end" begin
    a, b = -1.5, 1.5
    delta = 0.01
    xGrid = a:delta:b
    f2(x) = (x < 0 ? x + 1 : 1 - x) * (abs(x) < 1 ? 1 : 0)
    y = [approximate_CDF(f2,u) for u in xGrid]
    @test isapprox(maximum(y),1.0,atol = 0.0001)
end