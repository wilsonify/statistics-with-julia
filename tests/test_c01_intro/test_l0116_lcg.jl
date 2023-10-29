using Plots; pyplot()

function linear_congruential_generator(a, c, m, N)
    next(z) = (a * z + c) % m

    data = Array{Float64, 1}(undef, N)

    x = 808
    for i in 1:N
        data[i] = x / m
        x = next(x)
    end

    return data
end

function main()
    N = 10^6
    data = linear_congruential_generator(69069, 1, 2^32, N)

    p1 = scatter(1:1000, data[1:1000], c = :blue, m = 4, msw = 0)
    p2 = histogram(data, bins = 50, normed = :true, ylims = (0, 1.1))
    plot(p1, p2, size = (800, 400), legend = :none)
end


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
