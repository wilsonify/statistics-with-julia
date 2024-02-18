using c01_intro: random_walk
using Test

# Define a test for the random_walk function
@testset "Test random_walk function" begin
    N = 5000
    alpha = 0.2
    rng = MersenneTwister(27)

    xDat, yDat = random_walk(N, alpha, rng)

    @test typeof(xDat) == Array{Any,1}
    @test typeof(yDat) == Array{Any,1}
    @test length(xDat) == N
    @test length(yDat) == N

    # Check that the random walk never goes too far from the origin
    max_distance = maximum(sqrt.(xDat .^ 2 .+ yDat .^ 2))
    @test max_distance <= 300.0
end
