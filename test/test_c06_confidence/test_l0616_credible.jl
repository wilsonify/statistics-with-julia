using Distributions, Plots, LaTeXStrings

function create_posterior(alpha, beta, data)
    new_alpha = alpha + sum(data)
    new_beta = beta + length(data)
    return Gamma(new_alpha, 1 / new_beta)
end

function calculate_coverage(dist, l, u)
    return cdf(dist, u) - cdf(dist, l)
end

function classical_ci(dist, significance)
    l, u = mode(dist), mode(dist)
    bestl, bestu = l, u
    while calculate_coverage(dist, l, u) < significance
        l -= 0.00001
        u += 0.00001
    end
    return (l, u)
end

function equal_tail_ci(dist, half_alpha)
    return (quantile(dist, half_alpha), quantile(dist, 1 - half_alpha))
end

function highest_density_ci(dist, x_grid, significance)
    height = 0.999 * maximum(pdf.(dist, x_grid))
    l, u = mode(dist), mode(dist)
    while calculate_coverage(dist, l, u) <= significance
        range = filter(theta -> pdf(dist, theta) > height, x_grid)
        l, u = minimum(range), maximum(range)
        height -= 0.00001
    end
    return (l, u)
end

function display_results(classical_ci, equal_tail_ci, highest_density_ci)
    println("Classical: ", classical_ci, "\tWidth: ", classical_ci[2] - classical_ci[1],
        "\tCoverage: ", calculate_coverage(post, classical_ci[1], classical_ci[2]))
    println("Equal tails: ", equal_tail_ci, "\tWidth: ", equal_tail_ci[2] - equal_tail_ci[1],
        "\tCoverage: ", calculate_coverage(post, equal_tail_ci[1], equal_tail_ci[2]))
    println("Highest density: ", highest_density_ci, "\tWidth: ", highest_density_ci[2] - highest_density_ci[1],
        "\tCoverage: ", calculate_coverage(post, highest_density_ci[1], highest_density_ci[2]))
end

coverage(l, u) = cdf(post,u) - cdf(post,l)

function equalTailCI(dist, significance)
significance = 0.9
halfAlpha = (1 - significance) / 2
lower = quantile(dist,halfAlpha)
upper = quantile(dist,1 - halfAlpha)
return (lower, upper)
end

function classicalCI(dist)
    l, u = mode(dist),mode(dist)
    bestl, bestu = l, u
    while  coverage(l,u) < significance
        l -= 0.00001; u += 0.00001
    end
    (l,u)
end
function highestDensityCI(dist)
    height = 0.999 * maximum(pdf.(dist,xGrid))
    l,u = mode(dist),mode(dist)
    while coverage(l,u) <= significance
        range = filter(theta -> pdf(dist,theta) > height, xGrid)
        l,u = minimum(range), maximum(range)
        height -= 0.00001
    end
    (l,u)
end


using Test

@testset "Test create_posterior function" begin
    alpha, beta = 8, 2
    data = [2, 1, 0, 0, 1, 0, 2, 2, 5, 2, 4, 0, 3, 2, 5, 0]
    post = create_posterior(alpha, beta, data)
    @test isa(post, Gamma)
end


@testset "Test calculate_coverage function" begin
    dist = Gamma(2, 1)
    l, u = 0.5, 1.5
    coverage_result = calculate_coverage(dist, l, u)
    @test isa(coverage_result, Float64)
end


@testset "Test classical_ci function" begin
    dist = Gamma(2, 1)
    significance = 0.9
    classical_ci_result = classical_ci(dist, significance)
    @test length(classical_ci_result) == 2
end


@testset "Test equal_tail_ci function" begin
    dist = Gamma(2, 1)
    half_alpha = 0.05
    equal_tail_ci_result = equal_tail_ci(dist, half_alpha)
    @test length(equal_tail_ci_result) == 2
end


@testset "Test highest_density_ci function" begin
    dist = Gamma(2, 1)
    x_grid = 0:0.01:2
    significance = 0.9
    highest_density_ci_result = highest_density_ci(dist, x_grid, significance)

    @test length(highest_density_ci_result) == 2
end


@testset "Test display_results function" begin
    classical_ci_result = (1.4, 2.9)
    equal_tail_ci_result = (1.45, 2.85)
    highest_density_ci_result = (1.5, 2.8)

    @test nothing # Placeholder test, as display_results only prints output
end


@testset "end_to_end" begin
alpha, beta = 8, 2
data = [2, 1, 0, 0, 1, 0, 2, 2, 5, 2, 4, 0, 3, 2, 5, 0]
post = create_posterior(alpha, beta, data)
xGrid = quantile(post,0.01):0.001:quantile(post,0.99)
l1, u1 = classicalCI(post)
l2, u2 = equalTailCI(post,0.9)
l3, u3 = highestDensityCI(post)
display_results(classical_ci, equal_tail_ci, highest_density_ci)

plot(xGrid,pdf.(post,xGrid),  yticks = (0:0.25:1.25),    c = :black, label = "Gamma Posterior Distribution",        xlims = (1.4, 2.9), ylims = (-0.4,1.25))
plot!([l1, u1],[-0.1, -0.1], label = "Classic CI",        c = :blue, shape = :vline, ms = 16)
plot!([l2, u2],[-0.2, -0.2], label = "Equal Tail CI",        c = :red, shape = :vline, ms = 16)
plot!([l3, u3],[-0.3, -0.3], label = "Highest Density CI",    c = :green, shape = :vline, ms = 16, xlabel = L"\lambda", ylabel = "Density")

end