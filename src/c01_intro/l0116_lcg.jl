# Linear Congruential Generator
using Plots; gr()

function linear_congruential_generator(a, c, m, N)
    next(z) = (a * z + c) % m

    data = Array{Float64, 1}(undef, N)

    x = 808
    for i in 1:N
        data[i] = x / m
        x = next(x)
    end

    return data
end

function main_lcg()
    N = 10^6
    data = linear_congruential_generator(69069, 1, 2^32, N)

    p1 = scatter(1:1000, data[1:1000], c = :blue, m = 4, msw = 0)
    p2 = histogram(data, bins = 50, normed = :true, ylims = (0, 1.1))
    plot(p1, p2, size = (800, 400), legend = :none)
end

if abspath(PROGRAM_FILE) == @__FILE__
    main_lcg()
end

export linear_congruential_generator