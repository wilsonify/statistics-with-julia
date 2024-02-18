
using StatisticsWithJulia.c02_probability: gen_pw
using StatisticsWithJulia.c02_probability: numMatch
using Test
using Random

@testset "Test gen_pw function" begin
    Random.seed!(0)
    result = gen_pw()
    @test length(result) == 8
end



@testset "Test numMatch function" begin
    Random.seed!(0)
    @test numMatch("3xyZu4vN") == 8
    @test numMatch("") == 0
    @test numMatch("abcdefg") == 0
end
