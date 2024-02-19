# Deep copy and shallow copy
using c04_data: immutable_behavior
using c04_data: no_copy_behavior
using c04_data: shallow_copy_outer_behavior
using c04_data: shallow_copy_inner_behavior
using c04_data: deep_copy_behavior
using Test
@testset "immutable_behavior" begin
    a = 10
    a = immutable_behavior(a)
    @test a == 10
end

@testset "no_copy_behavior" begin
    a = [10]
    a = no_copy_behavior(a)
    @test a == [20]
end

@testset "shallow_copy_outer_behavior" begin
    a = [10]
    a = shallow_copy_outer_behavior(a)
    @test a == [10]
end

@testset "shallow_copy_inner_behavior" begin
    a = [[10]]
    a = shallow_copy_inner_behavior(a)
    @test a == [[20]]
end

@testset "deep_copy_behavior" begin
    a = [[10]]
    a = deep_copy_behavior(a)
    @test a == [[10]]
end
