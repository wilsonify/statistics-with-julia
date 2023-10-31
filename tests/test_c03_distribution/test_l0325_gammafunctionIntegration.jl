# The gamma function at 1/2
using QuadGK, SpecialFunctions

function main()
g(x) = x^(0.5 - 1) * MathConstants.e^-x
quadgk(g,0,Inf)[1], sqrt(pi), gamma(1 / 2),  gamma(1 / 2)
end