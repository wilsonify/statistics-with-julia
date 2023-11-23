using RDatasets, StatsPlots;

using Test
@testset "end_to_end" begin
    iris = dataset("datasets", "iris")
    @df iris andrewsplot(:Species,
        cols(1:4),
        line = (fill = [:blue :red :green]),
        legend = :topleft)
end
