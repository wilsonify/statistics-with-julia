# The gamma and beta special functions
using SpecialFunctions, Distributions
# SpecialFunctions package for gamma(), beta(), and factorial() for noninteger z.

function main_l0324_betaDist()
    # beta() at a and b is evaluated in three different ways.
    a, b = 0.2, 0.7
    x = 0.75
    betaAB1 = beta(a,b)
    betaPDFAB1 = pdf(Beta(a,b),x)

    betaAB2 = (gamma(a) * gamma(b)) / gamma(a + b)
    betaPDFAB2 = (1 / beta(a,b)) * x^(a - 1) * (1 - x)^(b - 1)

    # factorial of non-integers is no longer supported in SpecialFunctions.jl
    # betaAB3 = (factorial(a - 1) * factorial(b - 1)) / factorial(a + b - 1)
    betaAB3 = (gamma(a) * gamma(b)) / gamma(a + b)

    println("beta($a,$b)    = $betaAB1,\t$betaAB2,\t$betaAB3 ")
    println("betaPDF($a,$b) at $x = $betaPDFAB1,\t$betaPDFAB2")
end

