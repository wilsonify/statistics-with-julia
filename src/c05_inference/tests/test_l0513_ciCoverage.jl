
@testset "end_to_end" begin
    Random.seed!(2)
    N = 100
    hitBounds, missBounds = run_simulation(N)
    groupedbar(hitBounds, bar_position = :stack, c = :blue, la = 0, fa = [0 1], label = "", ylims = (3,8))
    groupedbar!(missBounds, bar_position = :stack,    c = :red, la = 0, fa = [0 1], label = "", ylims = (3,8))
    plot!([0, N + 1],[mu, mu],    c = :black, xlims = (0,N + 1),    ylims = (3,8), label = "Parameter value", ylabel = "Value Estimate")
end