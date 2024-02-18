
using StatisticsWithJulia.c02_probability: fishing_simulation
using StatisticsWithJulia.c02_probability: estimate_proportion_fish_caught
using StatisticsWithJulia.c02_probability: plot_fishing_proportions
using Test

# Test the fishing_simulation function
@testset "Test fishing_simulation function" begin
    goldFish, silverFish, n = 3, 4, 3
    N = 10^6
    without_replacement = fishing_simulation(goldFish, silverFish, n, N, false)
    with_replacement = fishing_simulation(goldFish, silverFish, n, N, true)
    @test without_replacement >= 0
    @test with_replacement >= 0
end

# Test the estimate_proportion function
@testset "Test estimate_proportion function" begin
    goldFish, silverFish, n = 3, 4, 3
    N = 10^6
    x, proportions = estimate_proportion_fish_caught(goldFish, silverFish, n, N, false)
    @test length(x) == n + 1
    @test length(proportions) == n + 1
    @test minimum(proportions) >= 0.0
    @test maximum(proportions) <= 1.0
end

# Test the plot_fishing_proportions function
@testset "Test plot_fishing_proportions function" begin
    goldFish, silverFish, n = 3, 4, 3
    N = 10^3
    plot_fishing_proportions(goldFish, silverFish, n, N, false)
    plot_fishing_proportions(goldFish, silverFish, n, N, true)
    # Manual inspection for plotting function
end
