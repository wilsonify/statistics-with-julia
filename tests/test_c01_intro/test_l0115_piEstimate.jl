using Random, LinearAlgebra, Plots; pyplot()
Random.seed!()

function estimate_pi(N)
    data = [[rand(), rand()] for _ in 1:N]
    indata = filter((x) -> (norm(x) <= 1), data)
    outdata = filter((x) -> (norm(x) > 1), data)
    piApprox = 4 * length(indata) / N
    return piApprox, indata, outdata
end

function main()
    N = 10^5
    piApprox, indata, outdata = estimate_pi(N)
    println("Pi Estimate: ", piApprox)

    scatter(first.(indata), last.(indata), c = :blue, ms = 1, msw = 0)
    scatter!(first.(outdata), last.(outdata), c = :red, ms = 1, msw = 0,
        xlims = (0, 1), ylims = (0, 1), legend = :none, ratio = :equal)
end


using Test

# Define a test for the estimate_pi function
@testset "Test estimate_pi function" begin
    N = 100000
    piApprox, indata, outdata = estimate_pi(N)

    @test typeof(piApprox) == Float64
    @test typeof(indata) == Vector{Vector{Float64}}
    @test typeof(outdata) == Vector{Vector{Float64}}

    @test piApprox >= 2.5
    @test piApprox <= 4.0

    # Ensure that all points are within the unit circle (indata) or outside it (outdata)
    @test all(norm.(indata) .<= 1.0)
    @test all(norm.(outdata) .> 1.0)
end
