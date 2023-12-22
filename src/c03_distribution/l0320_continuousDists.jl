# Families of continuous distributions
using Distributions

function range_of_dist(d)
    return (minimum(d),maximum(d))
    end

function summarize_dist(d)
    return [d ; params(d) ; range_of_dist(d)]
end

function main_l0320_continuousDists()
    dists = [
    Uniform(10,20),
    Exponential(3.5),
    Gamma(0.5,7),
    Beta(10,0.5),
    Weibull(10,0.5),
    Normal(20,3.5),
    Rayleigh(2.4),
    Cauchy(20,3.5)]
    println("Distribution \t\t\t Parameters \t Support")
    reshape(summarize_dist.(dists), length(dists),3)
end

if abspath(PROGRAM_FILE) == @__FILE__
    main_l0320_continuousDists()
end