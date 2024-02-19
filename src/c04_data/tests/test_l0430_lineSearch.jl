using Test
using c04_data: lineSearch

@testset "lineSearch test" begin
    path_to_here = @__DIR__
    path_to_data = abspath("$path_to_here/../../../data")
    lineSearch("$path_to_data/earth.txt", "$path_to_data/waterLines.txt", "water")
end