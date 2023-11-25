using StatisticsWithJulia: plot_p1
using StatisticsWithJulia: plot_p2
using StatisticsWithJulia: plot_p3
using StatisticsWithJulia: plot_function
using Plots
using Test

@testset "Test plot_p1 functions" begin
    xVals, yVals = -5:0.1:5, -5:0.1:5
    p1 = plot_p1(xVals)
    @test typeof(p1) == Plots.Plot{Plots.GRBackend}
end

@testset "Test plot_p2 functions" begin
    xVals, yVals = -5:0.1:5, -5:0.1:5
    p2 = plot_p2(xVals, yVals)
    @test typeof(p2) == Plots.Plot{Plots.GRBackend}
end


@testset "Test plot_p3 functions" begin
    xVals, yVals = -5:0.1:5, -5:0.1:5
    p3 = plot_p3(xVals, yVals)
    @test typeof(p3) == Plots.Plot{Plots.GRBackend}
end


@testset "Test plot_function functions" begin
    xVals, yVals = -5:0.1:5, -5:0.1:5
    p_combined = plot_function(xVals, yVals)
    @test typeof(p_combined) == Plots.Plot{Plots.GRBackend}
end


