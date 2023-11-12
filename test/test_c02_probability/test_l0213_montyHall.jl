using Random

function monty_hall_game(switch_policy)
    prize, choice = rand(1:3), rand(1:3)
    if prize == choice
        revealed = rand(setdiff(1:3, choice))
    else
        revealed = rand(setdiff(1:3, [prize, choice]))
    end

    if switch_policy
        choice = setdiff(1:3, [revealed, choice])[1]
    end
    return choice == prize
end

function monty_hall_simulation(N, switch_policy)
    successes = sum([monty_hall_game(switch_policy) for _ in 1:N])
    return successes / N
end

using Test

@testset "Monty Hall Problem Tests" begin
    N = 10^6

    success_stay = monty_hall_simulation(N, false)
    @test isapprox(success_stay, 1/3, atol=1e-3)

    success_switch = monty_hall_simulation(N, true)
    @test isapprox(success_switch, 2/3, atol=1e-3)
end
