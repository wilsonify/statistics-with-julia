# Roots of a polynomial
using Roots

function polynomialGenerator(a...)
    n = length(a) - 1
    poly = function(x)
                return sum([a[i + 1] * x^i for i in 0:n])
            end
    return poly
end


# Tests for polynomial Generator
using Test

@testset "Test polynomialGenerator function" begin
    polynomial = polynomialGenerator(1,3,-10)
    zeroVals = find_zeros(polynomial,-10,10)
    zeroVals = round.(zeroVals,digits=2)
    @test zeroVals == [-0.20, 0.50]
end




