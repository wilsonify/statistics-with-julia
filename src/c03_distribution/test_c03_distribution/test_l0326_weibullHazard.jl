# Hazard rates and the Weibull distribution
using StatisticsWithJulia.c03_distribution: lambda
using StatisticsWithJulia.c03_distribution: theta
using StatisticsWithJulia.c03_distribution: hA
using StatisticsWithJulia.c03_distribution: hB
using Distributions, Plots, LaTeXStrings
using Test
@testset "hazardsA" begin
    alphas = [0.5, 1.5, 1]
    lam = 2
    dists = [Weibull.(a,theta(lam,a)) for a in alphas]
    xGrid = 0.01:0.01:10
    hazardsA = [hA.(d,xGrid) for d in dists]
end

@testset "hazardsB" begin
    alphas = [0.5, 1.5, 1]
    lam = 2
    dists = [Weibull.(a,theta(lam,a)) for a in alphas]
    xGrid = 0.01:0.01:10
    hazardsB = [hB.(d,xGrid) for d in dists]
end

@testset "hazards in agreement." begin
    alphas = [0.5, 1.5, 1]
    lam = 2
    dists = [Weibull.(a,theta(lam,a)) for a in alphas]
    xGrid = 0.01:0.01:10
    hazardsA = [hA.(d,xGrid) for d in dists]
    hazardsB = [hB.(d,xGrid) for d in dists]
    @test isapprox(maximum(hazardsA),maximum(hazardsB),atol = 0.01)
end

@testset "end_to_end" begin
    alphas = [0.5, 1.5, 1]
    lam = 2
    dists = [Weibull.(a,theta(lam,a)) for a in alphas]
    xGrid = 0.01:0.01:10
    hazardsA = [hA.(d,xGrid) for d in dists]
    hazardsB = [hB.(d,xGrid) for d in dists]
    println("Maximum difference between two implementations of hazard: ", maximum(maximum.(hazardsA - hazardsB)))
    Cl = [:blue :red :green]
    Lb = [L"\lambda=" * string(lambda(d)) * ",   " * L"\alpha =" * string(shape(d)) for d in dists]
    plot(xGrid, hazardsA, c=Cl, label=reshape(Lb, 1,:), xlabel="x", ylabel="Instantaneous failure rate", xlims=(0,10), ylims=(0,10))
end