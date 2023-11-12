# Expectation via numerical integration
using QuadGK

f1(x) = 3 / 4 * (1 - x^2)
f2(x) = x < 0 ? x + 1 : 1 - x
expect(f, support) = quadgk((x) -> x*f(x),support...)[1]

function main()
    sup = (-1,1)
    println("Mean 1: ", expect(f1,sup))
    println("Mean 2: ", expect(f2,sup))
end
using Test
@testset "f1 test" begin
    xGridC = -1:0.01:1
    result = f1.(xGridC)
    @test length(result) == 201
end
@testset "f2 test" begin
    xGridC = -1:0.01:1
    result = f2.(xGridC)
    @test length(result) == 201
end
@testset "expect f1 test" begin
    sup = (-1,1)
    result = expect(f1,sup)
    @test round(result,digits=2) == 0.00
end
@testset "expect f2 test" begin
    sup = (-1,1)
    result = expect(f2,sup)
    @test round(result,digits=2) == -0.00
end