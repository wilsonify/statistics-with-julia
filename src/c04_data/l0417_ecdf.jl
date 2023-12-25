# Empirical cumulative distribution function
#=
The first few lines of the code block are
similar to the previous examples using a mixture distribution.
A difference is that,
in line 9,
we define the function mixCDF() which is the CDF of the mixture distribution.
We then generate two samples
in lines 12–13,
of varying sample sizes.
In lines 15–16,
we invoke the ecdf() function from StatsBase.
The returned object can then be used as a function,
evaluating F̂ (·) at any point.
This is done in lines 19–20
where we plot the ECDFs evaluated on xGrid.
Then lines 21–23 plot the actual CDF.
=#
using Random, Distributions, StatsBase, Plots; gr()
function main_l0417_ecdf()
    Random.seed!(0)

    mu1, sigma1 = 10, 5
    mu2, sigma2 = 40, 12
    dist1, dist2 = Normal(mu1,sigma1), Normal(mu2,sigma2)
    p = 0.3
    mixRv() = (rand() <= p) ? rand(dist1) : rand(dist2)
    mixCDF(x) = p*cdf(dist1,x) + (1 - p) * cdf(dist2,x)

    n = [30, 100]
    data1 = [mixRv() for _ in 1:n[1]]
    data2 = [mixRv() for _ in 1:n[2]]

    empiricalCDF1 = ecdf(data1)
    empiricalCDF2 = ecdf(data2)

    xGrid = -10:0.1:80
    plot(xGrid,empiricalCDF1.(xGrid), c = :blue, label = "ECDF with n = $(n[1])")
    plot!(xGrid,empiricalCDF2.(xGrid), c = :red, label = "ECDF with n = $(n[2])")
    plot!(xGrid, mixCDF.(xGrid), c = :black, label = "Underlying CDF",
        xlims = (-10,80), ylims = (0,1),
        xlabel = "x", ylabel = "Probability", legend = :topleft)
end

using Random, Distributions, StatsBase, Plots; gr()

# Define a custom function to generate the test data
function generate_mixture_data(n, mu1, sigma1, mu2, sigma2, p)
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

using Test
@testset "generate_mixture_data Test" begin
    Random.seed!(0)
    mu1, sigma1 = 10, 5
    mu2, sigma2 = 40, 12
    p = 0.3
    n1 = 30
    n2 = 100

    data1 = generate_mixture_data(n1, mu1, sigma1, mu2, sigma2, p)
    @test length(data1) == n1
    @test typeof(data1) == Vector{Float64}

    data2 = generate_mixture_data(n2, mu1, sigma1, mu2, sigma2, p)
    @test length(data2) == n2
    @test typeof(data2) == Vector{Float64}
end

# Define a test for ECDF plots
@testset "ECDF Plot Test" begin
    Random.seed!(0)
    mu1, sigma1 = 10, 5
    mu2, sigma2 = 40, 12
    p = 0.3
    n1 = 30
    n2 = 100
    xGrid = -10:0.1:80

    data1 = generate_mixture_data(n1, mu1, sigma1, mu2, sigma2, p)
    data2 = generate_mixture_data(n2, mu1, sigma1, mu2, sigma2, p)
    empiricalCDF1 = ecdf(data1)
    empiricalCDF2 = ecdf(data2)
    ecdf_plot = plot(xGrid, empiricalCDF1.(xGrid), c = :blue, label = "ECDF with n = $n1")
    plot!(xGrid, empiricalCDF2.(xGrid), c = :red, label = "ECDF with n = $n2")
    plot_mixCDF(n2, mu1, sigma1, mu2, sigma2, p)
end

function main_ecdf()
    Random.seed!(0)
    mu1, sigma1 = 10, 5
    mu2, sigma2 = 40, 12
    dist1, dist2 = Normal(mu1, sigma1), Normal(mu2, sigma2)
    p = 0.3
    mixRv() = (rand() <= p) ? rand(dist1) : rand(dist2)
    mixCDF(x) = p * cdf(dist1, x) + (1 - p) * cdf(dist2, x)
    n = [30, 100]
    data1 = [mixRv() for _ in 1:n[1]]
    data2 = [mixRv() for _ in 1:n[2]]

    empiricalCDF1 = ecdf(data1)
    empiricalCDF2 = ecdf(data2)
    xGrid = -10:0.1:80
    plot(xGrid, empiricalCDF1.(xGrid), c = :blue, label = "ECDF with n = $(n[1])")
    plot!(xGrid, empiricalCDF2.(xGrid), c = :red, label = "ECDF with n = $(n[2])")
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
