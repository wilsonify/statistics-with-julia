

using Test

@testset "Monty Hall Problem Tests" begin
    N = 10^6

    success_stay = monty_hall_simulation(N, false)
    @test isapprox(success_stay, 1/3, atol=1e-3)

    success_switch = monty_hall_simulation(N, true)
    @test isapprox(success_switch, 2/3, atol=1e-3)
end
