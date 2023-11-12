using Random, Distributions, StatsPlots

alpha = 0.05
mu = 5.57
L(obs) = obs - (1 - sqrt(alpha))
U(obs) = obs + (1 - sqrt(alpha))

function generate_data_point_triangle(mu)
    triDist = TriangularDist(mu - 1,mu + 1,mu)
    return rand(triDist)
end

function run_simulation(N)
    hitBounds, missBounds = zeros(N, 2), zeros(N,2)
    for i in 1:N
        observation = generate_data_point_triangle(mu)
        LL, UU = L(observation), U(observation)
        if LL <= mu && mu <= UU
            hitBounds[i, :] = [LL  UU - LL]
        else
            missBounds[i, :] = [LL  UU - LL]
        end
    end
    return hitBounds, missBounds
end

@testset "end_to_end" begin
    Random.seed!(2)
    N = 100
    hitBounds, missBounds = run_simulation(N)
    groupedbar(hitBounds, bar_position = :stack, c = :blue, la = 0, fa = [0 1], label = "", ylims = (3,8))
    groupedbar!(missBounds, bar_position = :stack,    c = :red, la = 0, fa = [0 1], label = "", ylims = (3,8))
    plot!([0, N + 1],[mu, mu],    c = :black, xlims = (0,N + 1),    ylims = (3,8), label = "Parameter value", ylabel = "Value Estimate")
end