# Tests for polynomial Generator
using c01_intro: polynomialGenerator
using c01_intro: find_zeros
using Test

@testset "Test polynomialGenerator function" begin
    polynomial = polynomialGenerator(1,3,-10)
    zeroVals = find_zeros(polynomial,-10,10)
    zeroVals = round.(zeroVals,digits=2)
    @test zeroVals == [-0.20, 0.50]
end




