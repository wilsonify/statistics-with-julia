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
