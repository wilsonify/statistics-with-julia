# The Box-Muller transform
using StatisticsWithJulia.c03_distribution: Z
using Random, Distributions, Plots
using Test
@testset "Z" begin
    xGrid = -4:0.01:4
    y1 = [Z() for _ in 1:10^6]
end
@testset "pdfNormal" begin
    xGrid = -4:0.01:4
    y2 = pdf.(Normal(),xGrid)
end
@testset "end_to_end" begin
    xGrid = -4:0.01:4
    y1 = [Z() for _ in 1:10^6]
    y2 = pdf.(Normal(),xGrid)
    histogram(y1, bins = 50, normed = true, label = "MC estimate")
    plot!(xGrid, y2, c = :red, lw = 4, label = "PDF", xlims = (-4,4), ylims = (0,0.5), xlabel = "x", ylabel = "f(x)" )
end