# Empirical cumulative distribution function

using Random
using Distributions
using StatsBase
using Plots; gr()

# Define a custom function to generate the test data
function generate_mixture_data_ecdf(n, mu1, sigma1, mu2, sigma2, p)
    dist1 = Normal(mu1, sigma1)
    dist2 = Normal(mu2, sigma2)
    mixRv() = (rand() <= p) ? rand(dist1) : rand(dist2)
    data = [mixRv() for _ in 1:n]
    return data
end

function plot_mixCDF(n, mu1, sigma1, mu2, sigma2, p)
    xGrid = -10:0.1:80
    dist1 = Normal(mu1, sigma1)
    dist2 = Normal(mu2, sigma2)
    mixCDF(x) = p * cdf(dist1, x) + (1 - p) * cdf(dist2, x)
    plot!(xGrid,
        mixCDF.(xGrid),
        c = :black,
        label = "Underlying CDF",
        xlims = (-10, 80),
        ylims = (0, 1),
        xlabel = "x",
        ylabel = "Probability",
        legend = :topleft)
end


function main_l0417_ecdf()
    # The first few lines of the code block are
    # similar to the previous examples using a mixture distribution.
    # A difference is that,
    Random.seed!(0)

    mu1, sigma1 = 10, 5
    mu2, sigma2 = 40, 12
    dist1, dist2 = Normal(mu1,sigma1), Normal(mu2,sigma2)
    p = 0.3
    # we define the function mixCDF() which is the CDF of the mixture distribution.
    # We then generate two samples
    mixRv() = (rand() <= p) ? rand(dist1) : rand(dist2)
    mixCDF(x) = p*cdf(dist1,x) + (1 - p) * cdf(dist2,x)

    # of varying sample sizes.
    n = [30, 100]
    data1 = [mixRv() for _ in 1:n[1]]
    data2 = [mixRv() for _ in 1:n[2]]

    # we invoke the ecdf() function from StatsBase.
    # The returned object can then be used as a function,
    # evaluating F̂ (·) at any point.
    empiricalCDF1 = ecdf(data1)
    empiricalCDF2 = ecdf(data2)

    # where we plot the ECDFs evaluated on xGrid.
    # Then lines 21–23 plot the actual CDF.
    xGrid = -10:0.1:80
    plot(xGrid,empiricalCDF1.(xGrid), c = :blue, label = "ECDF with n = $(n[1])")
    plot!(xGrid,empiricalCDF2.(xGrid), c = :red, label = "ECDF with n = $(n[2])")
    plot!(xGrid, mixCDF.(xGrid), c = :black, label = "Underlying CDF", xlims = (-10,80), ylims = (0,1), xlabel = "x", ylabel = "Probability", legend = :topleft)
end

export generate_mixture_data_ecdf