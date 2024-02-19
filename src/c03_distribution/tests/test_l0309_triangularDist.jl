# Using the pdf(), cdf(), and quantile() functions with Distributions
using c03_distribution: TriangularPDF
using c03_distribution: TriangularCDF
using c03_distribution: TriangularInvCDF
using Distributions, Plots, LaTeXStrings
using Test

@testset "TriangularPDF" begin
    a = 0
    b = 2
    c = 1
    xGrid = a:0.01:b
    uGrid = 0:0.01:1
    result = TriangularPDF(a,b,c)
    @test length(result) == 201
end

@testset "TriangularCDF" begin
    a = 0
    b = 2
    c = 1
    xGrid = a:0.01:b
    uGrid = 0:0.01:1
    result = TriangularCDF(a,b,c)
    @test length(result) == 201
end

@testset "TriangularInvCDF" begin
    a = 0
    b = 2
    c = 1
    xGrid = a:0.01:b
    uGrid = 0:0.01:1
    result = TriangularInvCDF(a,b,c)
    @test length(result) == 101
end

@testset "end_to_end" begin
    a = 0
    b = 2
    c = 1
    xGrid = a:0.01:b
    uGrid = 0:0.01:1
    y1 = TriangularPDF(a,b,c)
    y2 = TriangularCDF(a,b,c)
    y3 = TriangularInvCDF(a,b,c)
    p1 = plot( xGrid, y1, c = :blue, xlims = (0,2), ylims = (0,1.1), xlabel = "x", ylabel = "f(x)")
    p2 = plot( xGrid, y2, c = :blue, xlims = (0,2), ylims = (0,1), xlabel = "x", ylabel = "F(x)")
    p3 = plot( uGrid, y3, c = :blue, xlims = (0,1), ylims = (0,2), xlabel = "u", ylabel = (L"F^{-1}(u)"))
    plot(p1, p2, p3, legend = false, layout = (1,3), size = (1200, 400))
end