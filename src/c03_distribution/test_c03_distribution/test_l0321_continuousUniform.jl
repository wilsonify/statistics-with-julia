using Distributions, Plots, LaTeXStrings
using Test
@testset "end_to_end" begin
    cUnif = Uniform(0,2π)
    xGrid = 0:0.1:2π
    N = 10^6
    stephist( rand(N) * 2π, bins = xGrid, normed = :true, c = :blue, label = "MC Estimate")
    plot!( xGrid, pdf.(cUnif,xGrid), c = :red,ylims = (0,0.2),label = "PDF", ylabel = "Density",xticks = ([0:π / 2:2π; ], ["0", L"\dfrac{\pi}{2}", L"\pi", L"\dfrac{3\pi}{2}", L"2\pi"]))
end