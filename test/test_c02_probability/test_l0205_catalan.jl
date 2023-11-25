using Random, Combinatorics, Plots, LaTeXStrings
Random.seed!(12)

# Function to check if a vector is an upper lattice path
function isUpperLattice(v)
    for i in 1:Int(length(v) / 2)
        sum(v[1:2 * i - 1]) >= i ? continue : return false
    end
    return true
end

# Function to estimate the probability pA_modelI
function estimate_pA_modelI(n)
    omega = unique(permutations([zeros(Int, n); ones(Int, n)]))
    A = omega[isUpperLattice.(omega)]
    pA_modelI = length(A) / length(omega)
    return pA_modelI
end

# Function to generate a random walk path
function randomWalkPath(n)
    x, y = 0, 0
    path = []
    while x < n && y < n
        if rand() < 0.5
            x += 1
            push!(path, 0)
        else
            y += 1
            push!(path, 1)
        end
    end
    append!(path, x < n ? zeros(Int64, n - x) : ones(Int64, n - y))
    return path
end

# Function to estimate the probability pA_modelIIest
function estimate_pA_modelIIest(n, N)
    pA_modelIIest = sum([isUpperLattice(randomWalkPath(n)) for _ in 1:N]) / N
    return pA_modelIIest
end

# Function to plot upper and non-upper lattice paths
function plotLatticePaths(n)
    plot()
    omega = unique(permutations([zeros(Int, n); ones(Int, n)]))
    A = omega[isUpperLattice.(omega)]
    upper_path = rand(A)
    non_upper_path = rand(setdiff(omega, A))

    x, y = 0, 0
    graphX, graphY = [x], [y]
    for i in upper_path
        if i == 0
            x += 1
        else
            y += 1
        end
        push!(graphX, x)
        push!(graphY, y)
    end

    plot!(graphX, graphY, la = 0.8, lw = 2, label = "Upper lattice path", c = :blue,
        ratio = :equal, legend = :topleft, xlims = (0, n), ylims = (0, n),
        xlabel = L"East\rightarrow", ylabel = L"North\rightarrow")

    x, y = 0, 0
    graphX, graphY = [x], [y]
    for i in non_upper_path
        if i == 0
            x += 1
        else
            y += 1
        end
        push!(graphX, x)
        push!(graphY, y)
    end

    plot!(graphX, graphY, la = 0.8, lw = 2, label = "Non-upper lattice path", c = :red,
        ratio = :equal, legend = :topleft, xlims = (0, n), ylims = (0, n))

    plot!([0, n], [0, n], ls = :dash, c = :black, label = "")
end

# Function to run the lattice paths simulation and tests
function lattice_paths_simulation(n, N)
    pA_modelI = estimate_pA_modelI(n)
    pA_modelIIest = estimate_pA_modelIIest(n, N)
    println("Model I: $pA_modelI \t Model II: $pA_modelIIest")
    plot()
    plotLatticePaths(n)
end

using Test

# Test the functions
@testset "Lattice Paths Simulation Tests" begin
    n, N = 5, 100
    pA_modelI = estimate_pA_modelI(n)
    pA_modelIIest = estimate_pA_modelIIest(n, N)
    @test pA_modelI >= 0.0
    @test pA_modelI <= 1.0
    @test pA_modelIIest >= 0.0
    @test pA_modelIIest <= 1.0
end

# Test the plotLatticePaths function (manual inspection)
@testset "Test plotLatticePaths function" begin
    n = 5
    plotLatticePaths(n)
    # Manual inspection for plotting function
    @test true
end
