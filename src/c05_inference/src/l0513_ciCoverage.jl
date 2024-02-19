#=
100 conﬁdence intervals.
The blue conﬁdence interval bars contain the unknown parameter,
while the red ones do not.
=#

using Random
using Distributions
using StatsPlots # groupedbar()

using Random, Distributions, StatsPlots

alpha = 0.05
mu = 5.57
L2(obs) = obs - (1 - sqrt(alpha))
U2(obs) = obs + (1 - sqrt(alpha))

function generate_data_point_triangle(mu)
    triDist = TriangularDist(mu - 1,mu + 1,mu)
    return rand(triDist)
end

function run_simulation1(N)
    hitBounds, missBounds = zeros(N, 2), zeros(N,2)
    for i in 1:N
        observation = generate_data_point_triangle(mu)
        LL, UU = L2(observation), U2(observation)
        if LL <= mu && mu <= UU
            hitBounds[i, :] = [LL  UU - LL]
        else
            missBounds[i, :] = [LL  UU - LL]
        end
    end
    return hitBounds, missBounds
end


function main_l0513_ciCoverage()
    Random.seed!(2)
    mu = 5.57
    triDist = TriangularDist(mu - 1,mu + 1,mu)
    N = 100
    # create the matrices hitBounds and missBounds.
    hitBounds, missBounds = zeros(N, 2), zeros(N,2)
    # repeat the experiment N = 100 times
    for i in 1:N
        observation = rand(triDist)
        LL, UU = L2(observation), U2(observation)
        # record a confidence interval as a “hit” or “miss”
        if LL <= mu && mu <= UU
            hitBounds[i, :] = [LL  UU - LL]
        else
            missBounds[i, :] = [LL  UU - LL]
        end
    end

    groupedbar(
    hitBounds,
    bar_position = :stack,
    c = :blue,
    la = 0,
    fa = [0 1],
    label = "",
    ylims = (3,8)
    )

    groupedbar!(
    missBounds,
    bar_position = :stack,
    c = :red,
    la = 0,
    fa = [0 1],
    label = "", ylims = (3,8)
    )
    plot!(
    [0, N + 1],
    [mu, mu],
    c = :black, xlims = (0,N + 1),
    ylims = (3,8),
    label = "Parameter value",
    ylabel = "Value Estimate"
    )
end