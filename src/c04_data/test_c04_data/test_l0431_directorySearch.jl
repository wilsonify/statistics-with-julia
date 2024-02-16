

using Test
using StatisticsWithJulia: directorySearch

@testset "directorySearch" begin
    directorySearch(@__DIR__, ".jl")
end
