# Generating random vectors with desired mean and covariance
using StatisticsWithJulia: generate_random_vectors_with_desired_mean_and_covariance
using StatisticsWithJulia: stats
using Distributions, LinearAlgebra, LaTeXStrings, Random, Plots
using Test
@testset "end_to_end" begin
  Random.seed!(1)
  N = 10^3
  SigY = [ 6 4 ; 4 9]
  muY = [15 ; 20]
  data = generate_random_vectors_with_desired_mean_and_covariance(muY,SigY,N)
  #stats(data)
  scatter(first.(data[1]), last.(data[1]), c = :blue, ms = 1, msw = 0, label = "Normal")
  scatter!(first.(data[2]), last.(data[2]), c = :red, ms = 1, msw = 0, label = "Uniform")
  scatter!(first.(data[3]), last.(data[3]), c = :green, ms = 1, msw = 0, label = "Exponential", xlims = (0,40), ylims = (0,40), legend = :bottomright, ratio = :equal, xlabel = L"X_1", ylabel = L"X_2")
end