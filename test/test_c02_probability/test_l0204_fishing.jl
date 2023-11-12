using StatsBase, Plots; pyplot()


# Function to perform fishing simulation
function fishing_simulation(gF, sF, n, N, withReplacement)
    fishInPond = [ones(Int64, gF); zeros(Int64, sF)]
    fishCaught = Int64[]
    for fish in 1:n
        fished = rand(fishInPond)
        push!(fishCaught, fished)
        if !withReplacement
            deleteat!(fishInPond, findfirst(x -> x == fished, fishInPond))
        end
    end
    return sum(fishCaught)
end

# Function to estimate the proportion of fish caught
function estimate_proportion(gF, sF, n, N, withReplacement)
    simulations = [fishing_simulation(gF, sF, n, N, withReplacement) for _ in 1:N]
    proportions = counts(simulations, 0:n) / N
    return 0:n, proportions
end

# Function to plot fishing proportions
function plot_fishing_proportions(gF, sF, n, N, withReplacement)
    plot()
    x, proportions = estimate_proportion(gF, sF, n, N, withReplacement)
    if withReplacement
        plot!(x, proportions, line = :stem, marker = :circle, c = :blue,
            ms = 6, msw = 0, label = "With replacement",
            xlabel = "n", ylims = (0, 0.6), ylabel = "Probability")
    else
        plot!(x, proportions, line = :stem, marker = :xcross, c = :red,
            ms = 6, msw = 0, label = "Without replacement")
    end
end



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
    x, proportions = estimate_proportion(goldFish, silverFish, n, N, false)
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
