# Quantile-Quantile Plots

using Random
using Distributions
using StatsPlots
using Measures
using Plots; gr()


function generate_beta_data(n, a, b)
    dist = Beta(a, b)
    data = rand(dist, n)
    return data
end


function main_l0421_qqPlot()
    Random.seed!(0)
    # define the distributions of the synthetic data and their parameters.
    n = 2000
    b1, b2 = 0.5 , 2
    dist1, dist2, = Beta(b1,b1), Beta(b2,b2)

    # create the sample data.
    data1 = rand(dist1,n)
    data2 = rand(dist2,n)

    # create the histograms.

    stephist(data1, bins = 15, label = "beta($b1,$b1)", c = :red, normed = true)
    p1 = stephist!(data2, bins = 15, label = "beta($b2,$b2)", c = :blue, xlabel = "x", ylabel = "Density",normed = true)
    # call the qqplot() function from StatsPlots and create the Q-Q plot.
    p2 = qqplot(
        data1,
        data2,
        c = :black,
        ms = 1,
        msw = 0,
        xlabel = "Quantiles for beta($b1,$b1) sample",
        ylabel = "Quantiles for beta($b2,$b2) sample",
        legend = false
        )


    plot(p1, p2, size = (800,400), margin = 5mm)
end

export generate_beta_data

if abspath(PROGRAM_FILE) == @__FILE__
    main_l0421_qqPlot()
end