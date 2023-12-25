# Quantile-Quantile Plots
#=
Lines 4–5
define the distributions of the synthetic data and their parameters.
Lines 7–9
create the sample data.
Lines 11–13
create the histograms.
Lines 15–18
call the qqplot() function from StatsPlots and create the Q-Q plot.
=#
using Random, Distributions, StatsPlots, Measures, Plots; gr()
function main_l0421_qqPlot()

    Random.seed!(0)

    b1, b2 = 0.5 , 2
    dist1, dist2, = Beta(b1,b1), Beta(b2,b2)

    n = 2000
    data1 = rand(dist1,n)
    data2 = rand(dist2,n)

    stephist(data1, bins = 15, label = "beta($b1,$b1)", c = :red, normed = true)
    p1 = stephist!(data2, bins = 15, label = "beta($b2,$b2)",
            c = :blue, xlabel = "x", ylabel = "Density",normed = true)

    p2 = qqplot(data1, data2, c = :black, ms = 1, msw = 0,
            xlabel = "Quantiles for beta($b1,$b1) sample",
            ylabel = "Quantiles for beta($b2,$b2) sample",
            legend = false)


    plot(p1, p2, size = (800,400), margin = 5mm)
end

using Random, Distributions, StatsPlots, Measures, Plots; gr()

function generate_beta_data(n, a, b)
    dist = Beta(a, b)
    data = rand(dist, n)
    return data
end

@testset "generate_beta_data test" begin
    Random.seed!(0)
    n = 2000
    b1 = 0.5
    b2 = 2
    data1 = generate_beta_data(n, b1, b1)
    @test length(data1) == n
    @test typeof(data1) == Vector{Float64}
end

@testset "plot hist" begin
    Random.seed!(0)
    n = 2000
    b1 = 0.5
    b2 = 2
    data1 = generate_beta_data(n, b1, b1)
    data2 = generate_beta_data(n, b2, b2)
    stephist(data1, bins = 15, label = "beta($b1,$b1)", c = :red, normed = true)
    p1 = stephist!(data2,
        bins = 15,
        label = "beta($b2,$b2)",
        c = :blue,
        xlabel = "x",
        ylabel = "Density",
        normed = true)
    p2 = qqplot(data1,
        data2,
        c = :black,
        ms = 1,
        msw = 0,
        xlabel = "Quantiles for beta($b1,$b1) sample",
        ylabel = "Quantiles for beta($b2,$b2) sample",
        legend = false)
    plot(p1, p2, size = (800, 400), margin = 5mm)
end
