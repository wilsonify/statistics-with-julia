using Random, Statistics, Distributions, Plots
Random.seed!(0)


using Distributions, Plots

function create_normal_distribution(mu, sigma)
    return Normal(mu, sigma)
end

function generate_observations(dist, nMax, alpha)
    piLarray, piUarray = [], []
    observations = rand(dist, 1)

    for _ in 2:nMax
        xNew = rand(dist)
        push!(observations, xNew)
        xbar, sd = mean(observations), std(observations)
        n = length(observations)
        tVal = quantile(TDist(n - 1), 1 - alpha / 2)
        delta = tVal * sd * sqrt(1 + 1 / n)
        piL, piU = xbar - delta, xbar + delta
        push!(piLarray, piL)
        push!(piUarray, piU)
    end

    return observations, piLarray, piUarray
end

function plot_results(nMax, observations, piLarray, piUarray)
    scatter(1:nMax, observations, c=:blue, msw=0, label="Observations")
    plot!(2:nMax, piUarray, c=:red, shape=:xcross, msw=0, label="Prediction Interval")
    plot!(2:nMax, piLarray, c=:red, shape=:xcross, msw=0, label="", ylims=(0, 100), xlabel="Number of observations", ylabel="Value")
end


using Test

@testset "end_to_end" begin
mu, sig = 50, 5
dist = create_normal_distribution(mu, sig)
alpha = 0.01
nMax = 40

observations, piLarray, piUarray = generate_observations(dist, nMax, alpha)
plot_results(nMax, observations, piLarray, piUarray)

end