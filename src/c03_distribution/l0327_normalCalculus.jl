# Numerical derivatives of the normal density
using Distributions, Calculus, SpecialFunctions, Plots; gr()

# Φ returns the corresponding value of the PDF of a standard normal distribution.
PhiA(x) = 0.5 * (1 + erf(x / sqrt(2)))
PhiB(x) = cdf(Normal(),x)

# define the function normalDensity()
normalDensity(z) = pdf(Normal(),z)

function main_l0327_normalCalculus()
    xGrid = -5:0.01:5
    #show the equivalence of the two ways of implementing Φ.
    mlphi1 = maximum(PhiA.(xGrid))
    mlphi2 = maximum(PhiB.(xGrid))
    println("Maximum difference between two CDF implementations: ", maximum(PhiA.(xGrid) - PhiB.(xGrid)))

    # evaluate normalDensity
    d0 = normalDensity.(xGrid)

    # define the derivative and second_derivative
    d1 = derivative.(normalDensity,xGrid)
    d2 = second_derivative.(normalDensity, xGrid)

    y1 = [d0 d1 d2]

    # plot the curves
    plot(xGrid, y1, c = [:blue :red :green],label = [L"f(x)" L"f'(x)" L"f''(x)"])
    plot!([-5, 5],[0, 0],  color = :black, lw = 0.5, xlabel = "x", xlims = (-5,5), label = "")
end


