# Families of discrete distributions
using Distributions

support_of_dist(d) = (minimum(d),maximum(d))

function summarizeDistributions(dists)
    # input array of distribution objects
    # output n × 3 tuple of type Any.
    # The first column is the actual distributions object,
    # the second column has the distributional parameters,
    # and the third column represents the support.
    # Note the use of an anonymous function (d)− >(minimum(d),maximum(d)) applied via “.” to each element of dists.
    # The use of reshape() transforms the array of arrays into a matrix of the desired dimensions.
    summarystats = Dict(
        :Distribution => dists,
        :Parameters => params.(dists),
        :support => support_of_dist.(dists)
    )
    return reshape([dists ; params.(dists) ; support_of_dist.(dists) ], length(dists),3)
end

function main_l0313_discreteDists()
    # define array of distribution objects.
    # in a REPL, Use ? <<Name>> to see The help provided by the distributions package
    dists = [
        DiscreteUniform(10,20),
        Binomial(10,0.5),
        Geometric(0.5),
        NegativeBinomial(10,0.5),
        Hypergeometric(30, 40, 10),
        Poisson(5.5)
    ]
    result = summarizeDistributions(dists)
    println("Distribution \t\t\t\t\t\t Parameters \t Support")
    println("$result")
end

if abspath(PROGRAM_FILE) == @__FILE__
    main_l0313_discreteDists()
end