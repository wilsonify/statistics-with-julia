#=
given observations, compute Lower and Upper confidence bounds

The virtue of the example is in presenting the 95% confidence interval,
as output

Based on the output (after rounding), we know that with 0.95 confidence,
the unknown parameter lies in the range [5.2, 6.75].
=#
using Random, Distributions

using Random, Distributions

# set the confidence level
alpha = 0.05
# implement lower and upper
L1(obs) = obs - (1 - sqrt(alpha))
U1(obs) = obs + (1 - sqrt(alpha))

function generate_data_triangle(mu)
    sample = rand(TriangularDist(mu - 1,mu + 1,mu))
    return sample
end

function main_l0512_confidenceIntervalConcept()
    Random.seed!(0)
    # set the actual (unknown) parameter value μ
    mu = 5.57
    # obtained the sample, a single observation.
    observation = rand(TriangularDist(mu - 1,mu + 1,mu))
    println("Lower bound L: ", L1(observation))
    println("Upper bound U: ", U1(observation))
end