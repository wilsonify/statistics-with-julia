using c01_intro: linear_congruential_generator


using Test

# Define a test for the linear_congruential_generator function
@testset "Test linear_congruential_generator function" begin
    a, c, m, N = 69069, 1, 2^32, 10^6
    data = linear_congruential_generator(a, c, m, N)

    @test typeof(data) == Vector{Float64}
    @test length(data) == N

    # Check that generated data points are within [0, 1)
    @test all(0.0 .<= data .< 1.0)

    # Check that the sequence is not constant
    @test length(unique(data)) > 1
end
