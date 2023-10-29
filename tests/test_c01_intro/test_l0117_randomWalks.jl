using Plots, Random; pyplot()

function random_walk(N, alpha, rng)
    x, y = 0.0, 0.0
    xDat, yDat = [], []
    for _ in 1:N
        flip = rand(rng, 1:4)
        if flip == 1
            x += 1
        elseif flip == 2
            y += 1
        elseif flip == 3
            x -= (2 + alpha) * rand(rng)
        elseif flip == 4
            y -= (2 + alpha) * rand(rng)
        end
        push!(xDat, x)
        push!(yDat, y)
    end
    return xDat, yDat
end

function main()
    N = 5000
    alphaRange = [0.2, 0.21, 0.22]

    p1 = plot(random_walk(N, alphaRange[1], MersenneTwister(27)), c = :blue)
    p1 = plot!(random_walk(N, alphaRange[2], MersenneTwister(27)), c = :red)
    p1 = plot!(random_walk(N, alphaRange[3], MersenneTwister(27)), c = :green)

    rng = MersenneTwister(27)
    p2 = plot(random_walk(N, alphaRange[1], rng), c = :blue)
    p2 = plot!(random_walk(N, alphaRange[2], rng), c = :red)
    p2 = plot!(random_walk(N, alphaRange[3], rng), c = :green)

    plot(p1, p2, size = (800, 400), legend = :none, xlims = (-150, 50), ylims = (-250, 50))
end


using Test

# Define a test for the random_walk function
@testset "Test random_walk function" begin
    N = 5000
    alpha = 0.2
    rng = MersenneTwister(27)

    xDat, yDat = random_walk(N, alpha, rng)

    @test typeof(xDat) == Vector{Float64}
    @test typeof(yDat) == Vector{Float64}
    @test length(xDat) == N
    @test length(yDat) == N

    # Check that the first and last coordinates are (0, 0)
    @test xDat[1] == 0.0
    @test yDat[1] == 0.0
    @test xDat[end] == 0.0
    @test yDat[end] == 0.0

    # Check that the random walk never goes too far from the origin
    max_distance = maximum(sqrt.(xDat .^ 2 .+ yDat .^ 2))
    @test max_distance <= 200.0
end
