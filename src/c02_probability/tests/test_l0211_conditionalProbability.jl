
using c02_probability: probDefectiveGivenParticles
using c02_probability: probParticles
using Test
using SpecialFunctions

@testset "test_defects_in_manufacturing" begin
    n = 2000
    numerical = sum([probDefectiveGivenParticles(k) * probParticles(k) for k in 0:n])
    analytic = 1 - 6 * zeta(3) / pi^2
    @test isapprox(numerical, analytic, atol=0.01)
end


