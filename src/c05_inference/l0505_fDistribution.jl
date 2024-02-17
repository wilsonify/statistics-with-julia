#=
Histogram of the ratio of two sample variances
against the PDF of an F-distribution.
=#
using Distributions, Plots; gr()

function main_l0505_fDistribution()

    # define the total number of observations for our two sample groups, n1 and n2,
    n1, n2 = 10, 15
    # define the total number of F-statistics we will generate, N.
    N = 10^6
    mu, sigma = 10, 4

    normDist = Normal(mu,sigma)

    fValues = Array{Float64}(undef, N)

    for i in 1:N
        # simulate two separate sample groups, data1 and data2,
        # by randomly sampling from the same underlying normal distribution.
        data1 = rand(normDist,n1)
        data2 = rand(normDist,n2)

        # calculate a single F-statistic from the ratio of the sample variances
        fValues[i] = var(data1) / var(data2)
    end


    # create the figure
    # constructor FDist() is used to create an F-distribution with the parameters n1-1 and n2-2.
    fRange = 0:0.1:5
    Fconstructor = pdf.(FDist(n1 - 1, n2 - 1), fRange)

    stephist(fValues, bins = 400, c = :blue, label = "Simulated", normed = true)
    plot!(fRange, Fconstructor,    c = :red, label = "Analytic", xlims = (0,5), ylims = (0,0.8),        xlabel = "F", ylabel = "Density")
end