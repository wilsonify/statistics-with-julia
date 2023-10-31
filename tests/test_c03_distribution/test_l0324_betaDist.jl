# The gamma and beta special functions
using SpecialFunctions, Distributions

function main()
a, b = 0.2, 0.7
x = 0.75

betaAB1 = beta(a,b)
betaAB2 = (gamma(a) * gamma(b)) / gamma(a + b)
# factorial of non-integers is no longer supported in SpecialFunctions.jl
#betaAB3 = (factorial(a - 1) * factorial(b - 1)) / factorial(a + b - 1)
betaAB3 = (gamma(a) * gamma(b)) / gamma(a + b)
betaPDFAB1 = pdf(Beta(a,b),x)
betaPDFAB2 = (1 / beta(a,b)) * x^(a - 1) * (1 - x)^(b - 1)

println("beta($a,$b)    = $betaAB1,\t$betaAB2,\t$betaAB3 ")
println("betaPDF($a,$b) at $x = $betaPDFAB1,\t$betaPDFAB2")
end