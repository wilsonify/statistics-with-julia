using Random
using Distributions
using KernelDensity
using Plots; gr()
using Test
using StatisticsWithJulia: generate_mixture_data


@testset "KDE Density Plot Test" begin
    Random.seed!(0)
    n = 2000
    mu1, sigma1 = 10, 5
    mu2, sigma2 = 40, 12
    p = 0.3
    data = generate_mixture_data(n, mu1, sigma1, mu2, sigma2, p)
    @test length(data) == n
    @test typeof(data) == Vector{Float64}
end

# Define a test for KDE density plot
@testset "KDE Density Plot Test" begin
    n = 2000
    mu1, sigma1 = 10, 5
    mu2, sigma2 = 40, 12
    p = 0.3
    data = generate_mixture_data(n, mu1, sigma1, mu2, sigma2, p)
    kdeDist = kde(data)
    xGrid = -20:0.1:80
    pdfKDE = pdf(kdeDist, xGrid)
    kde_density_plot = plot(xGrid, pdfKDE, c = :blue, label = "KDE PDF")
end

# Define a test for histogram plot
@testset "Histogram Plot Test" begin
    n = 2000
    mu1, sigma1 = 10, 5
    mu2, sigma2 = 40, 12
    p = 0.3
    data = generate_mixture_data(n, mu1, sigma1, mu2, sigma2, p)
    histogram_plot = stephist!(data, bins = 50, c = :black, normed = true, label = "Histogram")
end

# Define a test for different bandwidth KDE plots
@testset "Different Bandwidth KDE Plot Test" begin
    n = 2000
    mu1, sigma1 = 10, 5
    mu2, sigma2 = 40, 12
    p = 0.3
    xGrid = -20:0.1:80
    data = generate_mixture_data(n, mu1, sigma1, mu2, sigma2, p)
    hVals = [0.5, 2, 10]
    kdeS = [kde(data, bandwidth = h) for h in hVals]
    kde_plots = plot()
    for (i, h) in enumerate(hVals)
        kde_pdf = pdf(kdeS[i], xGrid)
        plot!(xGrid, kde_pdf, label = "h=$h", legend = :topleft)
    end
end
