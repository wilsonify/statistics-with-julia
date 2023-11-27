# A simple random variable
using StatisticsWithJulia: randomName
using StatsBase
using Test
using Plots; gr()

@testset "randomName test" begin
    rn = randomName()
    @test length(rn) > 2
end

@testset "end_to_end" begin
    X = 3:8
    N = 10^6
    sampleLengths = [length(randomName()) for _ in 1:N]
    bar(X,counts(sampleLengths) / N, ylims = (0,0.35), xlabel = "Name length", ylabel = "Estimated p(x)", legend = :none)
    #savefig("l0301_random_variable_bar.png")
end
