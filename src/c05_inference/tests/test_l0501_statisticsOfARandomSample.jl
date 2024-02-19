using Test
using c05_inference: simulate_exponential_samples

@testset "Exponential Distribution Test" begin
    lambda = 4.5  # Adjust lambda value as needed
    n = 10
    N = 1000

    means, variances = simulate_exponential_samples(lambda, n, N)
    # for an exponential distribution with rate λ,
    # the mean is λ−1 and the variance is λ−2.
    expected_mean = 1 / lambda
    expected_var = 1 / lambda^2

    expDist = Exponential(1 / lambda)
    actual_mean = mean(expDist)
    actual_var = var(expDist)

    mean_of_sampled_means = mean(means)
    mean_of_sampled_vars = mean(variances)

    @test round(actual_mean,digits=2) == round(expected_mean,digits=2)
    @test round(mean_of_sampled_means,digits=2) == round(expected_mean,digits=2)
    @test round(actual_var,digits=2) == round(expected_var,digits=2)
    @test round(mean_of_sampled_vars,digits=2) == round(expected_var,digits=2)
end
