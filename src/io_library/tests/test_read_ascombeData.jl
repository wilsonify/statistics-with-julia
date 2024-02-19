
using Test
using DataFrames
using io_library: read_anscombe_from_csv

@testset "read_anscombe_from_csv test" begin
    data = read_anscombe_from_csv("$(@__DIR__)/../../../data/anscombe.csv")
    @test nrow(data) == 11
end