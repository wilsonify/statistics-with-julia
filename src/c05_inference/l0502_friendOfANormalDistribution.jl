#=
Histograms of the simulated sample means, sample variances, and T-statistics
against their analytic counterparts.
=#

using Distributions, Plots; gr()

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
    sample_var_pfd = (n - 1) / sigma^2 * pdf.(Chisq(n - 1)

    # the PDF of the T-statistic (T)
    sample_tstat_pfd = pdf.(TDist(n - 1)

    # create histograms of the sample means, sample variances, and T-statistics
    # on top of their analytic PDF

    xRangeMean = 5:0.1:15
    xRangeVar = 0:0.1:60
    # normalized by (n-1)/sigma^2 for use with scaled chi-squared distribution.
    xRangeVarScaled = xRangeVar * (n - 1) / sigma^2)
    xRangeTStat = -5:0.1:5

    p1 = stephist(sMeans, bins = 50, c = :blue, normed = true, legend = false)
    p1 = plot!(xRangeMean, sample_mean_pfd, xRangeMean), c = :red, xlims = (5,15), ylims = (0,0.35), xlabel = "Sample mean",ylabel = "Density")

    p2 = stephist(sVars, bins = 50, c = :blue, normed = true, label = "Simulated")
    p2 = plot!(xRangeVar, sample_var_pfd, xRangeVarScaled, c = :red, label = "Analytic", xlims = (0,60), ylims = (0,0.06),    xlabel = "Sample Variance",ylabel = "Density")

    p3 = stephist(tStats, bins = 100, c = :blue, normed = true, legend = false)
    p3 = plot!(xRangeTStat, sample_tstat_pfd, xRangeTStat), c = :red, xlims = (-5,5), ylims = (0,0.4), xlabel = "t-statistic",ylabel = "Density")
    plot(p1, p2, p3, layout = (1,3), size=(1200, 400))
end