
using Distributions, LaTeXStrings, Random, Plots; gr()

function statPair(dist, n)
    sample = rand(dist,n)
    [mean(sample), var(sample)]
end


function sim_dataUni(N, n)
    stdUni = Uniform(-sqrt(3),sqrt(3))
    result = [statPair(stdUni,n) for _ in 1:N]
    return result
    end

function sim_dataUniInd(N, n)
    stdUni = Uniform(-sqrt(3),sqrt(3))
    result = [[mean(rand(stdUni,n)), var(rand(stdUni,n))] for _ in 1:N]
    return result
    end

function sim_dataNorm(N, n)
    stdUni = Uniform(-sqrt(3),sqrt(3))
    result = [statPair(Normal(),n) for _ in 1:N]
     return result
     end

function sim_dataNormInd(N, n)
        stdUni = Uniform(-sqrt(3),sqrt(3))
     result = [[mean(rand(Normal(),n)), var(rand(Normal(),n))] for _ in 1:N]
     return result
     end



function plot_swarm_uniform(dataUni, dataUniInd)
    p1 = scatter(first.(dataUni), last.(dataUni),  c = :blue, ms = 1, msw = 0, label = "Same group")
    p1 = scatter!(first.(dataUniInd), last.(dataUniInd),  c = :red, ms = 0.8, msw = 0, label = "Separate group", xlabel = L"\overline{X}", ylabel = L"S^2")
return p1
end

function plot_swarm_normal(dataNorm, dataNormInd)
    p2 = scatter(first.(dataNorm), last.(dataNorm),  c = :blue, ms = 1, msw = 0, label = "Same group")
    p2 = scatter!(first.(dataNormInd), last.(dataNormInd), c=:red, ms=0.8, msw=0, label="Separate group", xlabel=L"\overline{X}", ylabel=L"$S^2$")
return p2
end


using Test, Random
@testset "statPair test" begin
    Random.seed!(0)
    n, N = 3, 10^5
    stdUni = Uniform(-sqrt(3),sqrt(3))
    result = statPair(stdUni,n)
    result = round.(result,digits = 2)
    @test length(result) == 2
end


@testset "sim_dataNorm test" begin
n, N = 3, 10^5
 result = sim_dataNorm(N,n)
 expected_result = []
 @test length(result) == N
 end

@testset "sim_dataNormInd test" begin
n, N = 3, 10^5
 result = sim_dataNormInd(N,n)
 expected_result = []
 @test length(result) == N
 end

@testset "sim_dataUni test" begin
n, N = 3, 10^5
 result = sim_dataUni(N,n)
 expected_result = []
 @test length(result) == N
 end

@testset "sim_dataUniInd test" begin
n, N = 3, 10^5
 result = sim_dataUniInd(N,n)
 expected_result = []
 @test length(result) == N
 end


@testset "end-to-end" begin
n, N = 3, 10^5
stdUni = Uniform(-sqrt(3),sqrt(3))

dataNorm = sim_dataNorm(N,n)
dataNormInd = sim_dataNormInd(N,n)
dataUni = sim_dataUni(N,n)
dataUniInd = sim_dataUniInd(N,n)

p1 = plot_swarm_uniform(dataUni,dataUniInd)
p2 = plot_swarm_normal(dataNorm,dataNormInd)

plot(p1, p2, ylims = (0,5), size = (800, 400))
end