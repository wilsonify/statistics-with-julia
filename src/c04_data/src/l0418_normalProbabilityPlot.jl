# Normal probability plot

using Random
using Distributions
using StatsPlots
using Plots; gr()

function generate_normal_data(n, mu, sigma)
    dist = Normal(mu, sigma)
    data = rand(dist, n)
    return data
end

function generate_exponential_data(n, lambda)
    dist = Exponential(lambda)
    data = rand(dist, n)
    return data
end

function main_l0418_normalProbabilityPlot()
    Random.seed!(0)

    mu = 20
    d1, d2 = Normal(mu,mu), Exponential(mu)

    n = 100
    # The distributions for the two synthetic datasets are defined in lines 4–5.
    # You can check that they have the same theoretical mean and variance
    # by using mean() and var() on d1 and d2.

    data1 = rand(d1,n)
    data2 = rand(d2,n)

    # then plot the normal probability plots
    # via the qqnorm() and qqnorm!() functions from StatsPlots.
    # The second function has a ! in the name
    # similar to other plotting functions that add onto an existing plot.
    qqnorm(data1, c = :blue, ms = 3, msw = 0, label = "Normal Data")
    qqnorm!(data2, c = :red, ms = 3, msw = 0, label = "Exponential Data", xlabel = "Normal Theoretical Quantiles", ylabel = "Data Quantiles", legend = true)
end

if abspath(PROGRAM_FILE) == @__FILE__
    main_l0418_normalProbabilityPlot()
end

export generate_normal_data
export generate_exponential_data

