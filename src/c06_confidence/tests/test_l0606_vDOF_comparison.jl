using Test
using Distributions
using c06_confidence: compute_tdArray
using c06_confidence: compute_coords

@testset "compute_tdArray" begin
    N = 10^6
    mu1, sig1, n1 = 0, 2, 8
    mu2, sig2, n2 = 0, 30, 15
    dist1 = Normal(mu1, sig1)
    dist2 = Normal(mu2, sig2)
    result = compute_tdArray(N)
    @test length(result) == N
end

@testset "end_to_end" begin
    N = 10^6
    mu1, sig1, n1 = 0, 2, 8
    mu2, sig2, n2 = 0, 30, 15
    dist1 = Normal(mu1, sig1)
    dist2 = Normal(mu2, sig2)
    tdArray = compute_tdArray()
    xCoords, yCoords1, yCoords2 = compute_coords(tdArray)
    scatter(xCoords, yCoords1, c = :blue, label = "Calculated v", msw = 0)
    scatter!(xCoords, yCoords2, c = :red, label = "Fixed v", msw = 0)
    plot!([-10, 10], [-10, 10],
     c = :black, lw = 0.3, xlims = (-8,8), ylims = (-8,8), ratio = :equal, label = "",
     xlabel = "Theoretical t-distribution quantiles",
     ylabel = "Simulated t-distribution quantiles", legend = :topleft
     )
end