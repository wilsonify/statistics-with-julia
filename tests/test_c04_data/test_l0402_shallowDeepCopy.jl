# Deep copy and shallow copy
using Test
@testset "Immutable" begin
    a = 10
    b = a
    b = 20
    @test a == 10
end

@testset "No copy" begin
    a = [10]
    b = a
    b[1] = 20
    @test a==[20]
end    
@testset "Copy" begin
    a = [10]
    b = copy(a)
    b[1] = 20
    @test a==[10]
end

@testset "Shallow copy" begin
    a = [[10]]
    b = copy(a)
    b[1][1] = 20
    @test a==[[20]]
end
@testset "Deep copy" begin
    a = [[10]]
    b = deepcopy(a)
    b[1][1] = 20
    @test a==[[10]]
end
