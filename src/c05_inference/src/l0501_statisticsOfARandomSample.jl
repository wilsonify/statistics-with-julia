#=
Histograms of the sample mean and sample variance of an exponential distribution
=#

using Random, Distributions, Plots; gr()
using Random, Distributions

function simulate_exponential_samples(lambda, n, N)
    Random.seed!(0)

    expDist = Exponential(1 / lambda)
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

    return means, variances
end


function main_l0501_statisticsOfARandomSample()
    Random.seed!(0)
    lambda = 1 / 4.5
    n, N    = 10, 10^6

    # for an exponential distribution with rate λ,
    # the mean is λ−1 and the variance is λ−2.
    expected_mean = 1 / lambda
    expected_var = 1 / lambda^2

    expDist = Exponential(1 / lambda)
    actual_mean = mean(expDist)
    actual_var = var(expDist)

    means, variances = simulate_exponential_samples(lambda, n, N)

    mean_of_sampled_means = mean(means)
    mean_of_sampled_vars = mean(variances)
    # the estimated expected value of our simulated data is a good approximation of the underlying exponential distribution.
    println("Expected mean:", expected_mean)
    println("Actual mean:",actual_mean)
    println("Mean of sample means:",mean_of_sampled)

    println("Expected variance:", expected_var)
    println("Actual variance: ",actual_var)
    println("Mean of sample variances: ", mean_of_sampled_vars)

    stephist(means, bins = 200, c = :blue, normed = true,        label = "Histogram of Sample Means")
    stephist!(variances, bins = 600, c = :red, normed = true,        label = "Histogram of Sample Variances", xlims = (0,40), ylims = (0,0.4),            xlabel = "Statistic value", ylabel = "Density")
end

export simulate_exponential_samples

