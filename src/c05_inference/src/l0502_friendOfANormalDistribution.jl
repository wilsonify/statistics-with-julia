#=
Histograms of the simulated sample means, sample variances, and T-statistics
against their analytic counterparts.
=#

using Distributions
using Plots; gr()


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

function main_friends_of_the_normal_distribution()
    mu, sigma = 10, 4
    n, N = 10, 10^6
    sMeans, sVars, tStats = simulate_normal_samples(mu, sigma, n, N)
    p1 = plot_sample_means(sMeans, mu, sigma, n)
    p2 = plot_sample_vars(sVars, n, sigma)
    p3 = plot_t_stats(tStats, n)
    plot(p1, p2, p3, layout=(1, 3), size=(1200, 400))
end

function main_l0502_friendOfANormalDistribution()
    # specify the parameters of the underlying normal distribution
    mu, sigma = 10, 4
    # specify the number of samples in each group n
    # specify the total number of Monte Carlo repetitions N.
    n, N = 10, 10^6

    # initialize three arrays to store means, variances, and T-statistics.
    sMeans = Array{Float64}(undef, N)
    sVars = Array{Float64}(undef, N)
    tStats = Array{Float64}(undef, N)

    # This process is repeated N times
    for i in 1:N
        # take sample observations
        data = rand(Normal(mu,sigma),n)
        # calculate the sample mean, sample variance, and T-statistic.
        sampleMean = mean(data)
        sampleVars = var(data)
        sMeans[i] = sampleMean
        sVars[i] = sampleVars
        tStats[i] = (sampleMean - mu) / (sqrt(sampleVars / n))
    end

    # the PDF of the sample mean
    sample_mean_pfd = pdf.(Normal(mu,sigma / sqrt(n)))

    # the PDF of a scaled chi-squared distribution
    sample_var_pfd = (n - 1) / sigma^2 * pdf.(Chisq(n - 1))

    # the PDF of the T-statistic (T)
    sample_tstat_pfd = pdf.(TDist(n - 1))

    # create histograms of the sample means, sample variances, and T-statistics
    # on top of their analytic PDF

    xRangeMean = 5:0.1:15
    xRangeVar = 0:0.1:60
    # normalized by (n-1)/sigma^2 for use with scaled chi-squared distribution.
    xRangeVarScaled = xRangeVar * (n - 1) / sigma^2
    xRangeTStat = -5:0.1:5

    p1 = stephist(sMeans, bins = 50, c = :blue, normed = true, legend = false)
    p1 = plot!(xRangeMean, sample_mean_pfd, xRangeMean, c = :red, xlims = (5,15), ylims = (0,0.35), xlabel = "Sample mean",ylabel = "Density")

    p2 = stephist(sVars, bins = 50, c = :blue, normed = true, label = "Simulated")
    p2 = plot!(xRangeVar, sample_var_pfd, xRangeVarScaled, c = :red, label = "Analytic", xlims = (0,60), ylims = (0,0.06),    xlabel = "Sample Variance",ylabel = "Density")

    p3 = stephist(tStats, bins = 100, c = :blue, normed = true, legend = false)
    p3 = plot!(xRangeTStat, sample_tstat_pfd, xRangeTStat, c = :red, xlims = (-5,5), ylims = (0,0.4), xlabel = "t-statistic",ylabel = "Density")
    plot(p1, p2, p3, layout = (1,3), size=(1200, 400))
end

export simulate_normal_samples
export compute_yMeanDensity
export compute_yVarDensity
export compute_yTStatDensity