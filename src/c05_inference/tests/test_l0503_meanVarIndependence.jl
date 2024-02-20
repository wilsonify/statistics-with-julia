
using Test
using c05_inference: statPair
using c05_inference: sim_dataNorm
using c05_inference: sim_dataNormInd
using c05_inference: sim_dataUni

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

    dataUni = sim_dataUni(N,n)
    dataUniInd = sim_dataUniInd(N,n)
    p1 = plot_swarm_uniform(dataUni,dataUniInd)

    dataNorm = sim_dataNorm(N,n)
    dataNormInd = sim_dataNormInd(N,n)
    p2 = plot_swarm_normal(dataNorm,dataNormInd)

    plot(p1, p2, ylims = (0,5), size = (800, 400))
end
