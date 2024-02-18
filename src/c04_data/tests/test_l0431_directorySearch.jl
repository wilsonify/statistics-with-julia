

using Test
using StatisticsWithJulia.c04_data: directorySearch

@testset "directorySearch" begin
    directorySearch(@__DIR__, ".jl")
end
