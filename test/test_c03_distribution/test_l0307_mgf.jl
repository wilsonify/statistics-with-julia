# A sum of two triangular random variables
using StatisticsWithJulia: mgf
using StatisticsWithJulia: mgfPointEst
using Distributions, Statistics, Plots

@testset "end_to_end" begin
    sGrid = -1:0.01:1
    dist1 = TriangularDist(0,1,1)
    dist2 = TriangularDist(0,1,0)
    N = 10^6
    data1, data2 = rand(dist1,N), rand(dist2,N)
    dataSum = data1 + data2
    y1 = [mgfPointEst(s) for s in sGrid]
    y2 = [mgf(s) for s in sGrid]
    p1 = histogram(dataSum, bins = 80, normed = :true, ylims = (0,1.4), xlabel = "z", ylabel = "PDF")
    p2 = plot(sGrid, y1, c = :blue, ylims = (0,3.5))
    p2 = plot!(sGrid, y2, c = :red)
    p2 = plot!( [minimum(sGrid), maximum(sGrid)], [minimum(sGrid), maximum(sGrid)].+1, c = :black, xlabel = "s", ylabel = "MGF")
    plot(p1, p2, legend = :none, size = (800, 400))
end