using Test
using Random
using Distributions
using StatsBase
using Plots; gr()
using c05_inference: compute_type_I_error
using c05_inference: compute_type_II_error
using c05_inference: plot_hypothesis_test
using c05_inference: main_l0515_simpleHypothesisTest

@testset "Type I Error" begin
    Random.seed!(0)

    mu0, sd, tau = 15, 2, 17.5
    P_Type_I = compute_type_I_error(mu0, sd, tau)
    @test P_Type_I == 0.11
end

@testset "Type II Error" begin
    Random.seed!(0)
    mu1, sd, tau = 18, 2, 17.5
    P_Type_II = compute_type_II_error(mu1, sd, tau)
    @test P_Type_II == 0.4
end

@testset "End-to-End" begin
    Random.seed!(0)
    # set the parameters of the example.
    mu0, mu1, sd, tau = 15, 18, 2, 17.5
    P_Type_I = compute_type_I_error(mu0, sd, tau)
    P_Type_II = compute_type_II_error(mu1, sd, tau)

    @test P_Type_I == 0.11
    @test P_Type_II == 0.4

    p1 = plot_hypothesis_test(mu0, mu1, sd, tau)

end

