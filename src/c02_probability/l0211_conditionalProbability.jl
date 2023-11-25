# Defects in manufacturing
using SpecialFunctions

probAgivenB(k) = 1 - 1 / (k + 1)
probB(k) = 6 / (pi * (k + 1))^2

function main_conditional_probability()
n = 2000
numerical = sum([probAgivenB(k) * probB(k) for k in 0:n])
analytic = 1 - 6 * zeta(3) / pi^2
println("Analytic: ", analytic, "\tNumerical: ", numerical)
end