using c01_intro: estimate_pi
using LinearAlgebra: norm
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
