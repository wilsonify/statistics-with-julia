using c01_intro: really_rand
using Test

@testset "Test set_seed_and_generate function" begin
    Random.seed!(1974)
    output = really_rand()
    output = round.(output,digits=2)
    @test length(output) == 3
    @test typeof(output) == Tuple{Float64,Float64,Float64}
end

@testset "Test set_seed_and_generate function" begin
    Random.seed!(1975)
    output = really_rand()
    output = round.(output,digits=2)
    @test length(output) == 3
    @test typeof(output) == Tuple{Float64,Float64,Float64}
end

