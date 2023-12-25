#=
We now introduce a completely different way to visualize high-dimensional data.
The idea is to represent a data vector via a real-valued function.
For any individual vector,
such a transformation cannot be generally useful,
however, when comparing groups of vectors,
it may yield a way to visualize structural differences in the data.

In line 4,
the andrewsplot() function from StatsPlots is used to plot the data.
Note the @df macro is used in a similar format to that of Listing 4.23.
The first argument, :Species, determines how the data should be grouped,
while the second argument determines what variables should be included in the calculation,
in this case columns 1–4.
=#
using RDatasets, StatsPlots
function main_l0426_andrewsPlot()
    iris = dataset("datasets", "iris")
    @df iris andrewsplot(:Species, cols(1:4),
        line = (fill = [:blue :red :green]), legend = :topleft)
end
using RDatasets, StatsPlots;

using Test
@testset "end_to_end" begin
    iris = dataset("datasets", "iris")
    @df iris andrewsplot(:Species,
        cols(1:4),
        line = (fill = [:blue :red :green]),
        legend = :topleft)
end
