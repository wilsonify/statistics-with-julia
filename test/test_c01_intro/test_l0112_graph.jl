using Plots

function initialize_graph_data(n)
    vertices = 1:n
    complexPts = [exp(im * 2 * π * k / n) for k in vertices]
    coords = [(real(p), imag(p)) for p in complexPts]
    xPts = first.(coords)
    yPts = last.(coords)
    edges = []
    for v in vertices, u in (v + 1):n
        push!(edges, (v, u))
    end
    data = Dict(
        "vertices" => vertices,
        "complexPts" => complexPts,
        "coords" => coords,
        "xPts" => xPts,
        "yPts" => yPts,
        "edges" => edges
    )
    return data
end

function create_graph_animation(data)
    vertices = data["vertices"]
    xPts = data["xPts"]
    yPts = data["yPts"]
    edges = data["edges"]
    anim = Animation()
    scatter(xPts, yPts, color = :blue, markersize = 4, ratio = 1, xlims = (-1.5, 1.5), ylims = (-1.5, 1.5), legend = false)
    for i in 1:length(edges)
        u, v = edges[i][1], edges[i][2]
        xpoints = [xPts[u], xPts[v]]
        ypoints = [yPts[u], yPts[v]]
        plot!(xpoints, ypoints, linecolor = :red)
        frame(anim)
    end
    return anim
end

function main()
    data = initialize_graph_data(16)
    animation = create_graph_animation(data)
    gif(animation, "graph.gif", fps = 60)
end

using Test


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
