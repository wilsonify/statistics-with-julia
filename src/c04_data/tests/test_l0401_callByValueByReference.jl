# Call by value vs. call by reference
using c04_data: f_mutable
using c04_data: f_immutable
using Test

@testset "f_immutable" begin
    x = 1
    @test typeof(x) == Int
    @test isimmutable(x) == true
    @test x == 1
    f_immutable(x)
    @test x == 1
end


@testset "f_immutable" begin
    x = [1]
    @test typeof(x) == Array{Int64, 1}
    @test isimmutable(x) == false
    @test x == [1]
    f_mutable(x)
    @test x == [0]
end