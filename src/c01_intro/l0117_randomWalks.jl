# Random walks and seeds
using Random
using Plots; gr()

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

function main_random_walks()
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

if abspath(PROGRAM_FILE) == @__FILE__
    main_random_walks()
end

export random_walk