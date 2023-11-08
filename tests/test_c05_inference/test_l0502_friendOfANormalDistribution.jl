using Distributions, Plots

function simulate_normal_samples(mu, sigma, n, N)
    sMeans = Array{Float64}(undef, N)
    sVars = Array{Float64}(undef, N)
    tStats = Array{Float64}(undef, N)

    for i in 1:N
        data = rand(Normal(mu, sigma), n)
        sampleMean = mean(data)
        sampleVars = var(data)
        sMeans[i] = sampleMean
        sVars[i] = sampleVars
        tStats[i] = (sampleMean - mu) / (sqrt(sampleVars / n))
    end

    return sMeans, sVars, tStats
end

function compute_yMeanDensity(mu, sigma, xRangeMean)
    n = length(xRangeMean)
    return pdf.(Normal(mu, sigma / sqrt(n)), xRangeMean)
end

function compute_yVarDensity(sigma, xRangeVar)
    n = length(xRangeVar)
    return (n - 1) / sigma^2 * pdf.(Chisq(n - 1), xRangeVar * (n - 1) / sigma^2)
end

function compute_yTStatDensity(xRangeTStat)
    n = length(xRangeTStat)
    return pdf.(TDist(n - 1), xRangeTStat)
end


function plot_sample_means(sMeans, mu, sigma, n)
    xRangeMean = 5:0.1:15
    yMeanDensity = compute_yMeanDensity(mu, sigma, xRangeMean)
    p1 = stephist(sMeans, bins=50, c=:blue, normed=true, legend=false)
    p1 = plot!(xRangeMean, yMeanDensity, c=:red, xlims=(5, 15), ylims=(0, 0.35), xlabel="Sample mean", ylabel="Density")
    return p1
end

function plot_sample_vars(sVars, n, sigma)
    xRangeVar = 0:0.1:60
    yVarDensity = compute_yVarDensity(sigma, xRangeVar)
    p2 = stephist(sVars, bins=50, c=:blue, normed=true, label="Simulated")
    p2 = plot!(xRangeVar, yVarDensity, c=:red, label="Analytic", xlims=(0, 60), ylims=(0, 0.06), xlabel="Sample Variance", ylabel="Density")
    return p2
end

function plot_t_stats(tStats, n)
    xRangeTStat = -5:0.1:5
    yTStatDensity = compute_yTStatDensity(xRangeTStat)
    p3 = stephist(tStats, bins=100, c=:blue, normed=true, legend=false)
    p3 = plot!(xRangeTStat, yTStatDensity, c=:red, xlims=(-5, 5), ylims=(0, 0.4), xlabel="t-statistic", ylabel="Density")
    return p3
end

function main()
    mu, sigma = 10, 4
    n, N = 10, 10^6
    sMeans, sVars, tStats = simulate_normal_samples(mu, sigma, n, N)
    p1 = plot_sample_means(sMeans, mu, sigma, n)
    p2 = plot_sample_vars(sVars, n, sigma)
    p3 = plot_t_stats(tStats, n)
    plot(p1, p2, p3, layout=(1, 3), size=(1200, 400))
end

using Test

@testset "end-to-end" begin
    using Distributions, Plots
    mu, sigma = 10, 4
    n, N = 10, 10^3
    sMeans, sVars, tStats = simulate_normal_samples(mu, sigma, n, N)

    @test length(sMeans) == N
    @test length(sVars) == N
    @test length(tStats) == N

    xRangeMean = 5:0.1:15
    xRangeVar = 0:0.1:60
    xRangeTStat = -5:0.1:5

    yMeanDensity = compute_yMeanDensity(mu, sigma, xRangeMean)
    yVarDensity = compute_yVarDensity(sigma, xRangeVar)
    yTStatDensity = compute_yTStatDensity(xRangeTStat)

    @test length(yMeanDensity) == 101
    @test length(yVarDensity) == 601
    @test length(yTStatDensity) == 101


    p1 = stephist(sMeans, bins=50, c=:blue, normed=true, legend=false)
    p1 = plot!(xRangeMean, yMeanDensity, c=:red, xlims=(5, 15), ylims=(0, 0.35), xlabel="Sample mean", ylabel="Density")

    p2 = stephist(sVars, bins=50, c=:blue, normed=true, label="Simulated")
    p2 = plot!(xRangeVar, yVarDensity, c=:red, label="Analytic", xlims=(0, 60), ylims=(0, 0.06), xlabel="Sample Variance", ylabel="Density")

    p3 = stephist(tStats, bins=100, c=:blue, normed=true, legend=false)
    p3 = plot!(xRangeTStat, yTStatDensity, c=:red, xlims=(-5, 5), ylims=(0, 0.4), xlabel="t-statistic", ylabel="Density")

    plot(p1, p2, p3, layout=(1, 3), size=(1200, 400))

end


# Function to test if two histograms are approximately equal
function test_histogram_equality(data, expected, label)
    bins = 200
    δ = 0.1
    hist_data, edges = histogram(data, bins=bins, density=true)
    hist_expected, _ = histogram(expected, bins=bins, density=true)
    test = abs(hist_data .- hist_expected) .< δ
    @test all(test) do
        println("Histogram test failed for $label")
        return false
    end
    return true
end

@testset "Statistical Simulations" begin
    mu, sigma = 10, 4
    n, N = 10, 10^6
    sMeans, sVars, tStats = simulate_normal_samples(mu, sigma, n, N)
    @test length(sMeans) == N
    @test length(sVars) == N
    @test length(tStats) == N
end
@testset "Sample Means" begin
    mu, sigma = 10, 4
    n, N = 10, 10^6
    sMeans, sVars, tStats = simulate_normal_samples(mu, sigma, n, N)

    label = "Sample Means"
    p1 = plot_sample_means(sMeans, mu, sigma, n)

end

@testset "Sample Variances" begin
    mu, sigma = 10, 4
    n, N = 10, 10^6
    sMeans, sVars, tStats = simulate_normal_samples(mu, sigma, n, N)


    label = "Sample Variances"
    p2 = plot_sample_vars(sVars, n, sigma)

end

@testset "t-Statistics" begin
    mu, sigma = 10, 4
    n, N = 10, 10^6
    sMeans, sVars, tStats = simulate_normal_samples(mu, sigma, n, N)

    label = "t-Statistics"
    p3 = plot_t_stats(tStats, n)
end


