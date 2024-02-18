using Test
@testset "statPair test" begin

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
