
# The gamma function at 1/2
using c03_distribution: g
using QuadGK, SpecialFunctions
using Test

@testset "numerical integration" begin
    @test isapprox(quadgk(g,0,Inf)[1] , sqrt(pi),atol = 0.01)
end

@testset "analytically expected" begin
    @test isapprox(quadgk(g,0,Inf)[1],gamma(1 / 2),atol = 0.01)
end
@testset "end_to_end" begin
    quadgk(g,0,Inf)[1], sqrt(pi), gamma(1 / 2),  gamma(1 / 2)
end