# Discrete uniform die toss
using StatsBase: counts
using Plots; gr()

function simulate_die_tosses(sided, N)
    faces = 1:sided
    return rand(faces,N)
end

function count_dice_roll_outcomes(sided, data)
    flat_data = vec(data)
    outcomes = 1:sided
    sample_size = length(data)
    value_counts = counts(flat_data, outcomes)
    return value_counts / sample_size
end

function main_l0314_uniformDiscreteDice()
    # define all possible outcomes of a six-sided die
    faces = 1:6
    # define how many die tosses to simulate.
    N = 10^6
    # uniformly and randomly generates N observations from our die
    simulated_die_tosses = simulate_die_tosses(6,N)
    # calculate proportion of times each outcome occurs.
    # Note that rand(DiscreteUniform(1,6),N) is identical
    mcEstimate = count_dice_roll_outcomes(6,simulated_die_tosses)
    # analytic PMF of six-sided die.
    x2 = [i for i in faces]
    y2 = [1 / 6 for _ in faces]
    # stem plot of the proportion of times each outcome occurs
    plot(faces, mcEstimate,  line = :stem, marker = :circle, c = :blue, ms = 10, msw = 0, lw = 4, label = "MC estimate")
    # plot the analytic PMF
    plot!(x2, y2, line = :stem, marker = :xcross, c = :red, ms = 6, msw = 0, lw = 2, label = "PMF", xlabel = "Face number", ylabel = "Probability", ylims = (0,0.22))
end


if abspath(PROGRAM_FILE) == @__FILE__
    main_l0314_uniformDiscreteDice()
end