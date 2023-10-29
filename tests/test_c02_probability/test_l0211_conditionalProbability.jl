# Defects in manufacturing
using SpecialFunctions

n = 2000

probAgivenB(k) = 1 - 1 / (k + 1)
probB(k) = 6 / (pi * (k + 1))^2

numerical = sum([probAgivenB(k) * probB(k) for k in 0:n])
analytic = 1 - 6 * zeta(3) / pi^2

println("Analytic: ", analytic, "\tNumerical: ", numerical)


using Test
using SpecialFunctions

function test_defects_in_manufacturing()
    n = 2000

    probAgivenB(k) = 1 - 1 / (k + 1)
    probB(k) = 6 / (pi * (k + 1))^2

    numerical = sum([probAgivenB(k) * probB(k) for k in 0:n])
    analytic = 1 - 6 * zeta(3) / pi^2

    @test isapprox(numerical, analytic, atol=1e-10)
end

test_defects_in_manufacturing()
