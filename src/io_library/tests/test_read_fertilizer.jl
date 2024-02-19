
using Test
using DataFrames
using io_library: read_fertilizer

@testset "read_fertilizer test" begin
    data = read_fertilizer("$(@__DIR__)/../../../data/fertilizer.csv")
    @test nrow(data) == 10
end