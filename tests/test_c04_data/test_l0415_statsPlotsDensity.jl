using Random, Distributions, StatsPlots

# Define a custom function to generate the test data
function generate_mixture_data(n, mu1, sigma1, mu2, sigma2, p)
    dist1, dist2 = Normal(mu1, sigma1), Normal(mu2, sigma2)
    mixRv() = (rand() <= p) ? rand(dist1) : rand(dist2)
    return [mixRv() for _ = 1:n]
end

using Test
@testset "generate_mixture_data Test" begin
    Random.seed!(0)
    n = 2000
    mu1, sigma1 = 10, 5
    mu2, sigma2 = 40, 12
    p = 0.3
    data = generate_mixture_data(n, mu1, sigma1, mu2, sigma2, p)
    @test length(data) == n
    @test typeof(data) == Vector{Float64}
end
@testset "Density Plot Test" begin
    Random.seed!(0)
    n = 2000
    mu1, sigma1 = 10, 5
    mu2, sigma2 = 40, 12
    p = 0.3
    data = generate_mixture_data(n, mu1, sigma1, mu2, sigma2, p)
    density_plot = density( data, c = :blue, label = "Density via StatsPlots", xlims = (-20, 80), ylims = (0, 0.035), )
    # Check if the density plot is not empty
    @test !isempty(density_plot)
end


@testset "Histogram Plot Test" begin
    Random.seed!(0)
    n = 2000
    mu1, sigma1 = 10, 5
    mu2, sigma2 = 40, 12
    p = 0.3
    data = generate_mixture_data(n, mu1, sigma1, mu2, sigma2, p)
    histogram_plot = stephist!( data, bins = 50, c = :black, norm = true, label = "Histogram", xlabel = "x", ylabel = "Density", )
    @test !isempty(histogram_plot)
end
