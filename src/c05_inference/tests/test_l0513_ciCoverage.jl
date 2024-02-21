
using Test
using Random
using Distributions
using StatsPlots # groupedbar()
using c05_inference: run_simulation1


@testset "end_to_end" begin
    Random.seed!(2)
    N = 100
    alpha = 0.05
    mu = 5.57
    hitBounds, missBounds = run_simulation1(N)
    groupedbar(hitBounds, bar_position = :stack, c = :blue, la = 0, fa = [0 1], label = "", ylims = (3,8))
    groupedbar!(missBounds, bar_position = :stack,    c = :red, la = 0, fa = [0 1], label = "", ylims = (3,8))
    plot!([0, N + 1],[mu, mu],    c = :black, xlims = (0,N + 1),    ylims = (3,8), label = "Parameter value", ylabel = "Value Estimate")
end