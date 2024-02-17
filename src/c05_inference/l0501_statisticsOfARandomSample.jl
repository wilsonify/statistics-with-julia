#=
Histograms of the sample mean and sample variance of an exponential distribution
=#

using Random, Distributions, Plots; gr()
using Random, Distributions

function simulate_exponential_samples(lambda, n, N)
    Random.seed!(0)

    expDist = Exponential(1 / lambda)
    means = Array{Float64}(undef, N)
    variances = Array{Float64}(undef, N)

    for i in 1:N
        data = rand(expDist, n)
        means[i] = mean(data)
        variances[i] = var(data)
    end

    return means, variances
end

function run_exponential_distribution_test(lambda, n, N)
    means, variances = simulate_exponential_samples(lambda, n, N)

    actual_mean = mean(Exponential(1 / lambda))
    actual_variance = var(Exponential(1 / lambda))

    return means, variances, actual_mean, actual_variance
end

function main_l0501_statisticsOfARandomSample()
    Random.seed!(0)
    lambda = 1 / 4.5
    expDist = Exponential(1 / lambda)
    n, N    = 10, 10^6

    # for an exponential distribution with rate λ,
    # the mean is λ−1 and the variance is λ−2.
    expected_mean = lambda - 1.0
    expected_var = lambda - 2.0

    # initialize empty array for means
    means = Array{Float64}(undef, N)
    # initialize empty array for variances
    variances = Array{Float64}(undef, N)

    # create N random samples
    for i in 1:N
        data = rand(expDist,n) # each sample is length n
        # For each sample, calculate the sample mean and sample variance
        means[i] = mean(data)
        variances[i] = var(data)
    end

    # the estimated expected value of our simulated data is a good approximation of the underlying exponential distribution.
    println("Expected mean:", expected_mean)
    println("Actual mean:",mean(expDist))
    println("Mean of sample means:",mean(means))

    println("Expected variance:", expected_var)
    println("Actual variance: ",var(expDist))
    println("Mean of sample variances: ",mean(variances))

    stephist(means, bins = 200, c = :blue, normed = true,        label = "Histogram of Sample Means")
    stephist!(variances, bins = 600, c = :red, normed = true,        label = "Histogram of Sample Variances", xlims = (0,40), ylims = (0,0.4),            xlabel = "Statistic value", ylabel = "Density")
end




using Test
@testset "Exponential Distribution Test" begin
    lambda = 4.5  # Adjust lambda value as needed
    n = 10
    N = 1000

    means, variances, actual_mean, actual_variance = run_exponential_distribution_test(lambda, n, N)

    # Test the calculated mean
    @test isapprox(mean(means), actual_mean, atol = 0.05)

    # Test the calculated variance
    @test isapprox(mean(variances), actual_variance, atol = 0.05)
end
