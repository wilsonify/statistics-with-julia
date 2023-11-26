using StatisticsWithJulia: infimum
using StatisticsWithJulia: invCDF
using Plots
using LaTeXStrings
using Test
@testset "infimum" begin
    xGrid = 0:0.01:10
    result = infimum(xGrid)
    @test result == 0.0
end

@testset "end_to_end" begin
    # deﬁne the grid over which we will evaluate the CDF.
    xGrid = 0:0.01:10
    # deﬁne the grid over which we will evaluate the inverse CDF.
    uGrid = 0:0.01:1
    # deﬁne the time proportion during which the server is busy.
    busy = 0.8
    # deﬁne the cumulative density function F(t)
    # Note that for values less than zero, the CDF evaluates to 0.
    F_example(t) = t <= 0 ? 0 : 1 - busy*exp(-(1 - busy)t)
    # CDF, via the F() function,
    y1 = [F_example(x) for x in xGrid]
    # and the inverse CDF, via the invF() functions
    y2 = [invCDF(F_example,u) for u in uGrid]
    # Lines 12–18 are used to plot both the original
    p1 = plot(xGrid,y1, c = :blue, xlims = (-0.1,10), ylims = (0,1), xlabel = L"x", ylabel = L"F(x)")
    p2 = plot(uGrid,y2, c = :blue, xlims = (0,0.95), ylims = (0,maximum(xGrid)), xlabel = L"u", ylabel = L"F^{-1}(u)")
    plot(p1, p2, legend = :none, size = (800, 400))
end