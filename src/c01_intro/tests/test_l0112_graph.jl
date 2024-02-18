using Test
using c01_intro: initialize_graph_data
using c01_intro: create_graph_animation

# Define a test for the initialize_graph_data function
@testset "Test initialize_graph_data function" begin
    n = 5
    result = initialize_graph_data(n)
    @test typeof(result["vertices"]) == UnitRange{Int64}
    @test length(result["vertices"]) == n
    @test typeof(result["complexPts"]) == Array{Complex{Float64},1}
    @test length(result["complexPts"]) == 5
    @test typeof(result["coords"]) == Array{Tuple{Float64,Float64},1}
    @test length(result["coords"]) == 5
    @test typeof(result["xPts"]) == Array{Float64,1}
    @test length(result["xPts"]) == 5
    @test typeof(result["yPts"]) == Array{Float64,1}
    @test length(result["yPts"]) == 5
    @test typeof(result["edges"]) == Array{Any,1}
    @test length(result["edges"]) == n * (n - 1) ÷ 2

end

# Define a test for the create_graph_animation function
@testset "Test create_graph_animation function" begin
    n = 5
    data = initialize_graph_data(n)
    result = create_graph_animation(data)

end
