using Test, Random
@testset "MLEest test" begin
    Random.seed!(0)
    trueDist = Uniform(-2, 5)
    sample = rand(trueDist,5)
    @test round(MLEest(sample),digits = 2) == 4.37

end

@testset "MMest test" begin
    Random.seed!(0)
    trueDist = Uniform(-2, 5)
    sample = rand(trueDist,5)
    @test round(MMest(sample),digits = 2) == 5.73
end
@testset "generate_data_uniform" begin
    Random.seed!(0)
    result = generate_data_uniform(5,2,5)
    result = round.(result,digits = 2)
    @test result == [4.47, 4.73, 2.49, 2.53, 2.84]
end

@testset "end_to_end" begin
res = run_simulation(200)
plot_results(res)
end