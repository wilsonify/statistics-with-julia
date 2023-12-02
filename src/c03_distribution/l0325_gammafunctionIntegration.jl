# The gamma function at 1/2
using QuadGK, SpecialFunctions

g(x) = x^(0.5 - 1) * MathConstants.e^-x

function main_l0325_gammafunctionIntegration()
    # uses the QuadGK package, in the same manner as introduced in L0303.
    # numerical integration is in agreement with the analytically expected result.
    println(quadgk(g,0,Inf)[1])
    println(sqrt(pi))
    println(gamma(1 / 2))
    println(gamma(1 / 2))
end


