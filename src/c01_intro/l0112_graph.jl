using Plots; gr()

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

function main_graph_animation()
    data = initialize_graph_data(16)
    animation = create_graph_animation(data)
    gif(animation, "graph.gif", fps = 60)
end
