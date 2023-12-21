# Hazard rates and the Weibull distribution
# the hazard rate function is used in reliability analysis and survival analysis.
# For a random variable T , representing the lifetime of an individual or a component,
# an interesting quantity is the instantaneous chance of failure at any time,
# given that the component has been operating without failure up to time x.
using Distributions, LaTeXStrings, Plots; gr()

# lambda implements shape of the hazard from the shape and scale of the weibull.
# Note the type specification ::Weibull and the use of the shape() and scale() functions.
lambda(dist::Weibull) = shape(dist) * scale(dist)^(-shape(dist))
# theta() implements scale of the hazard, the bijection from λ to θ
theta(lam, alpha) = (alpha / lam)^(1 / alpha)

# implement two alternative ways of calculating the hazard rate function.
# hA uses the weibull pdf
hA(dist, x) = pdf(dist,x) / ccdf(dist,x)
# hB uses lambda.
hB(dist, x) = lambda(dist) * x^(shape(dist) - 1)

function main_l0326_weibullHazard()
    alphas = [0.5, 1.5, 1]
    lam = 2
    # construct three Weibull objects
    dists = [Weibull.(a,theta(lam,a)) for a in alphas]
    xGrid = 0.01:0.01:10
    hazardsA = [hA.(d,xGrid) for d in dists]
    hazardsB = [hB.(d,xGrid) for d in dists]
    # verify that the two implementations are in agreement.
    println("Maximum difference between two implementations of hazard: ",  maximum(maximum.(hazardsA - hazardsB)))
    # create Figure of Hazard rate functions for different Weibull distributions.
    Cl = [:blue :red :green]
    Lb = [L"\lambda=" * string(lambda(d)) * ",   " * L"\alpha =" * string(shape(d))  for d in dists]
    plot(xGrid, hazardsA, c=Cl, label=reshape(Lb, 1,:), xlabel="x", ylabel="Instantaneous failure rate", xlims=(0,10), ylims=(0,10))
end

