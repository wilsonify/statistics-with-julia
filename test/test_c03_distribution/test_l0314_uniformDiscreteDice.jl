using StatisticsWithJulia: simulate_die_tosses
using StatisticsWithJulia: count_dice_roll_outcomes
using StatsBase
using Plots
using Random
using Test
@testset "simulate_die_tosses" begin
    Random.seed!(0)
    result = simulate_die_tosses(6,10)
    @test length(result) == 10
    #@test result == [5, 1, 3, 1, 6, 4, 6, 6, 3, 3]
end

@testset "count_outcomes" begin
    Random.seed!(0)
    result = count_dice_roll_outcomes(6,simulate_die_tosses(6,10^3))
    @test length(result) == 6
end

@testset "end_to_end" begin
    faces = 1:6
    N = 10^6
    simulated_die_tosses = simulate_die_tosses(6,N)
    mcEstimate = count_dice_roll_outcomes(6,simulated_die_tosses)
    x2 = [i for i in faces]
    y2 = [1 / 6 for _ in faces]
    plot(faces, mcEstimate,  line = :stem, marker = :circle, c = :blue, ms = 10, msw = 0, lw = 4, label = "MC estimate")
    plot!(x2, y2, line = :stem, marker = :xcross, c = :red, ms = 6, msw = 0, lw = 2, label = "PMF", xlabel = "Face number", ylabel = "Probability", ylims = (0,0.22))
end