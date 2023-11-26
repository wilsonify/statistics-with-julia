# The gamma function at 1/2
using QuadGK, SpecialFunctions
using Test
@testset "end_to_end" begin
g(x) = x^(0.5 - 1) * MathConstants.e^-x
quadgk(g,0,Inf)[1], sqrt(pi), gamma(1 / 2),  gamma(1 / 2)
end