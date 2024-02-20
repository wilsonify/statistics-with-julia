using Test
using c05_inference: MLEest
using c05_inference: MMest
using c05_inference: generate_data_uniform
using c05_inference: run_simulation2
using c05_inference: plot_results

@testset "MLEest test" begin
    trueDist = Uniform(-2, 5)
    sample = rand(trueDist,5)
    result = MLEest(sample)
    @test typeof(result)==Float64
end

@testset "MMest test" begin
    trueDist = Uniform(-2, 5)
    sample = rand(trueDist,5)
    result = MMest(sample)
    @test typeof(result)==Float64
end

@testset "generate_data_uniform" begin
    result = generate_data_uniform(5,2,5)
    result = round.(result,digits = 2)
    @test length(result) == 5
end

@testset "end_to_end" begin
    res = run_simulation2(200)
    plot_results(res)
end