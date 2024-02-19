
using Test
using DataFrames
using io_library: read_temperatures
using io_library: read_temperatures_subset

@testset "read_temperatures test" begin
    data = read_temperatures("$(@__DIR__)/../../../data/temperatures.csv")
    @test nrow(data) == 777
end

@testset "read_temperatures_subset test" begin
    data = read_temperatures_subset("$(@__DIR__)/../../../data/temperatures.csv")
    @test length(data) == 777
end