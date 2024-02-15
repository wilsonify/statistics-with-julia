# Alternative representations of Rayleigh random variables
using StatisticsWithJulia: generate_rayleigh_data1
using StatisticsWithJulia: generate_rayleigh_data2
using StatisticsWithJulia: generate_rayleigh_data3
using Distributions, Random
using Test
@testset "generate_rayleigh_data1" begin
    N = 10^6
    sig = 1.7
    data1 = generate_rayleigh_data1(N,sig)
    @test length(data1) == N
end
@testset "generate_rayleigh_data2" begin
    N = 10^6
    sig = 1.7
    data2 = generate_rayleigh_data2(N,sig)
    @test length(data2) == N
end
@testset "Rayleigh" begin
    N = 10^6
    sig = 1.7
    data3 = generate_rayleigh_data3(N,sig)
    @test length(data3) == N
end

@testset "end_to_end" begin
    N = 10^6
    sig = 1.7
    data1 = generate_rayleigh_data1(N,sig)
    data2 = generate_rayleigh_data2(N,sig)
    data3 = generate_rayleigh_data3(N,sig)
    @test isapprox(mean(data1),mean(data2),atol = 0.01)
    @test isapprox(mean(data1),mean(data3),atol = 0.01)
    @test isapprox(mean(data2),mean(data3),atol = 0.01)
end