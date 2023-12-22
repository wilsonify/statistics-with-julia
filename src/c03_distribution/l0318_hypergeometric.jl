# Comparison of several hypergeometric distributions
using Distributions, Plots; gr()

function main_l0318_hypergeometric()
    # define the population size, L,
    L = 500
    # the sample size n,
    n = 30
    # the array K, which contains the number of successes in the population
    # for each of our five scenarios
    K = [450, 400, 250, 100, 50]
    # create several hypergeometric distributions.
    # The constructor takes three arguments,
    # the number of successes in the population k,
    # the number of failures in the population L-k,
    # and the number of times we sample from the population without replacement n.
    hyperDists = [Hypergeometric(k,L - k,n) for k in K]

    xGrid = 0:1:n
    # create an array of arrays by applying the pdf() function on each distribution.
    pmfs = [ pdf.(dist, xGrid) for dist in hyperDists ]
    # plot a bar chart of the PMF for each hypergeometric distribution in hyperDists.
    # Notice the use of hcat(labels...) to convert labels
    labels = "Successes = " .* string.(K)
    bar( xGrid, pmfs, alpha = 0.8, c = [:orange :purple :green :red :blue ], label = hcat(labels...), ylims = (0,0.25), xlabel = "x", ylabel = "Probability", legend = :top)
end


if abspath(PROGRAM_FILE) == @__FILE__
    main_l0318_hypergeometric()
end