using Random, Distributions, KernelDensity, Plots

# Define a custom function to generate the test data
function generate_mixture_data(n, mu1, sigma1, mu2, sigma2, p)
    dist1, dist2 = Normal(mu1, sigma1), Normal(mu2, sigma2)
    mixRv() = (rand() <= p) ? rand(dist1) : rand(dist2)
    return [mixRv() for _ = 1:n]
end

using Test

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
    kde_density_plot = plot( xGrid, pdfKDE, c = :blue, label = "KDE PDF" )


end

# Define a test for histogram plot
@testset "Histogram Plot Test" begin
    n = 2000
    mu1, sigma1 = 10, 5
    mu2, sigma2 = 40, 12
    p = 0.3
    data = generate_mixture_data(n, mu1, sigma1, mu2, sigma2, p)
    histogram_plot = stephist!( data, bins = 50, c = :black, normed = true, label = "Histogram" )


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


function main()
    Random.seed!(0)
    mu1, sigma1 = 10, 5
    mu2, sigma2 = 40, 12
    dist1, dist2 = Normal(mu1, sigma1), Normal(mu2, sigma2)
    p = 0.3
    mixRv() = (rand() <= p) ? rand(dist1) : rand(dist2)
    mixPDF(x) = p * pdf(dist1, x) + (1 - p) * pdf(dist2, x)
    n = 2000
    data = [mixRv() for _ = 1:n]
    kdeDist = kde(data)
    xGrid = -20:0.1:80
    pdfKDE = pdf(kdeDist, xGrid)
    plot(xGrid, pdfKDE, c = :blue, label = "KDE PDF")
    stephist!(data, bins = 50, c = :black, normed = :true, label = "Histogram")
    p1 = plot!( xGrid, mixPDF.(xGrid), c = :red, label = "Underlying PDF", xlims = (-20, 80), ylims = (0, 0.035), legend = :topleft, xlabel = "X", ylabel = "Density", )
    hVals = [0.5, 2, 10]
    kdeS = [kde(data, bandwidth = h) for h in hVals]
    plot(xGrid, pdf(kdeS[1], xGrid), c = :green, label = "h=$(hVals[1])")
    plot!(xGrid, pdf(kdeS[2], xGrid), c = :blue, label = "h=$(hVals[2])")
    p2 = plot!( xGrid, pdf(kdeS[3], xGrid), c = :purple, label = "h=$(hVals[3])", xlims = (-20, 80), ylims = (0, 0.035), legend = :topleft, xlabel = "X", ylabel = "Density", )
    plot(p1, p2, size = (800, 400))
end
