using StatsPlots
using Test

@testset "end_to_end" begin
    iris = read_iris_from_csv("$(@__DIR__)/../../data/iris.csv")
    @df iris andrewsplot(:Species,
        cols(1:4),
        line = (fill = [:blue :red :green]),
        legend = :topleft)
end