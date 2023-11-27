# Fishing with and without replacement
using StatsBase, Plots; gr()


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
function estimate_proportion_fish_caught(gF, sF, n, N, withReplacement)
    simulations = [fishing_simulation(gF, sF, n, N, withReplacement) for _ in 1:N]
    proportions = counts(simulations, 0:n) / N
    return 0:n, proportions
end

# Function to plot fishing proportions
function plot_fishing_proportions(gF, sF, n, N, withReplacement)
    plot()
    x, proportions = estimate_proportion_fish_caught(gF, sF, n, N, withReplacement)
    if withReplacement
        plot!(x, proportions, line = :stem, marker = :circle, c = :blue,
            ms = 6, msw = 0, label = "With replacement",
            xlabel = "n", ylims = (0, 0.6), ylabel = "Probability")
    else
        plot!(x, proportions, line = :stem, marker = :xcross, c = :red,
            ms = 6, msw = 0, label = "Without replacement")
    end
end

