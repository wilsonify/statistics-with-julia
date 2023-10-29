using Plots, LaTeXStrings, Measures

function plot_p1(xVals)
    f0(x) = x^2
    f2(x) = x^2 + 4
    p = plot(xVals, [f0.(xVals), f2.(xVals)],
             c = [:blue :red], xlims = (-5, 5), legend = :top,
             ylims = (-5, 25), ylabel = L"f(x,\cdot)", label = [L"f(x,0)" L"f(x,2)"])
    annotate!(0, -0.2, text("(0,0) The minimum\n of f(x,0)", :left, :top, 10))
    return p
end

function plot_p2(xVals, yVals)
    z = [x^2 + y^2 for y in yVals, x in xVals]
    p = surface(xVals, yVals, z, c = cgrad([:blue, :red]), legend = :none,
                ylabel = "y", zlabel = L"f(x,y)")
    return p
end

function plot_p3(xVals, yVals)
    z = [x^2 + y^2 for y in yVals, x in xVals]
    M = z[1:10, 1:10]
    p = heatmap(M, c = cgrad([:blue, :red]), yflip = true, ylabel = "y",
                xticks = ([1:10; ], xVals), yticks = ([1:10; ], yVals))
    return p
end

function plot_function(xVals, yVals)
    p1 = plot_p1(xVals)
    p2 = plot_p2(xVals, yVals)
    p3 = plot_p3(xVals, yVals)
    plot(p1, p2, p3, layout = (1, 3), size = (1200, 400), xlabel = "x", margin = 5mm)
end

function main()
    xVals, yVals = -5:0.1:5, -5:0.1:5
    plot_p1(xVals, yVals)
    plot_p2(xVals, yVals)
    plot_p3(xVals, yVals)
    plot_function(xVals, yVals)
end


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


