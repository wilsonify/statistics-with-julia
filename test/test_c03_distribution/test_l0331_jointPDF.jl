# Visualizing a bivariate density
using StatisticsWithJulia: twoD_Riemann_sum_over_density
using StatisticsWithJulia: twoD_Riemann_sum_to_evaluate_probability
using LaTeXStrings, Measures
using Plots; gr()
using Test

@testset "twoD_Riemann_sum_over_density" begin
    delta = 0.01
    grid = 0:delta:1
    result = twoD_Riemann_sum_over_density(grid,grid)
end

@testset "twoD_Riemann_sum_to_evaluate_probability" begin
    delta = 0.01
    grid = 0:delta:1
    densityIntegral = twoD_Riemann_sum_over_density(grid,grid)
    println("2-dimensional Riemann sum over density: ", densityIntegral)
    result = twoD_Riemann_sum_to_evaluate_probability(grid)
end

@testset "end_to_end" begin
    delta = 0.01
    grid = 0:delta:1
    f_poly(x, y) = 9 / 8 * (4x + y) * sqrt((1 - x) * (1 - y))
    densityIntegral = twoD_Riemann_sum_over_density(grid,grid)
    println("2-dimensional Riemann sum over density: ", densityIntegral)
    probB = twoD_Riemann_sum_to_evaluate_probability(grid)
    println("2-dimensional Riemann sum to evaluate probability: ", probB)
    p1 = surface(grid, grid, z, c = cgrad([:blue, :red]), la = 1, camera = (60,50), ylabel = "y", zlabel = L"f(x,y)", legend = :none)
    p2 = contourf(grid, grid, z, c = cgrad([:blue, :red]))
    p2 = contour!(grid, grid, z, c = :black, xlims = (0,1), ylims = (0,1), ylabel = "y", ratio = :equal)
    plot(p1, p2, size = (800, 400), xlabel = "x", margin = 5mm)
end