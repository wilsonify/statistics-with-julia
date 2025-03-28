using StatsBase, Combinatorics, Random, Plots; gr()


function probEst(n, N)
    # Function to estimate the probability of a birthday match
    match_count = sum([bdEvent(n) for _ in 1:N])
    return match_count / N
end


function bdEvent(n)
    # Function to check if a birthday match exists
    birthdays = rand(1:365, n)
    dayCounts = counts(birthdays, 1:365)
    return maximum(dayCounts) > 1
end


function matchExists1(n)
    # Function to calculate the analytical solution for the birthday problem
    return 1 - prod([k / 365 for k in 365:-1:365 - n + 1])
end

function matchExists2(n)
    # Alternative Function to calculate the analytical solution for the birthday problem
     return 1 - factorial(365,365 - big(n)) / 365^big(n)
end

function calculate_max_error(xGrid)
    # Function to calculate the maximum error between analytical solutions
    analyticSolution1 = [matchExists1(n) for n in xGrid]
    analyticSolution2 = [matchExists2(n) for n in xGrid]
    return maximum(abs.(analyticSolution1 - analyticSolution2))
end


function run_simulation_birthday_problem(N, xGrid)
    # Function to run the Monte Carlo simulation and compare with analytical solution
    mcEstimates = [probEst(n, N) for n in xGrid]
    max_error = calculate_max_error(xGrid)
    return xGrid, mcEstimates, max_error
end

function main_birthday_probability()
    xGrid = 1:50
    analyticSolution1 = [matchExists1(n) for n in xGrid]
    analyticSolution2 = [matchExists2(n) for n in xGrid]
    println("Maximum error: $(maximum(abs.(analyticSolution1 - analyticSolution2)))")
    N = 10^3
    mcEstimates = [probEst(n,N) for n in xGrid]
    plot(xGrid, analyticSolution1, c = :blue, label = "Analytic solution")
    scatter!(xGrid, mcEstimates, c = :red, ms = 6, msw = 0, shape = :xcross,
    label = "MC estimate", xlims = (0,50), ylims = (0, 1),
    xlabel = "Number of people in room",
    ylabel = "Probability of birthday match",
    legend = :topleft)
end

if abspath(PROGRAM_FILE) == @__FILE__
    main_birthday_probability()
end

export matchExists1
export matchExists2
export probEst
export bdEvent
export calculate_max_error
export run_simulation_birthday_problem

