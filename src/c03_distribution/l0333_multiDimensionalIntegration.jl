# Multidimensional integration using the HCubature package
using HCubature
# The function definition
f(x) = (2 * pi)^(-length(x) / 2) * exp(-(1/2)*x'x)

function main_l0333_multiDimensionalIntegration()
    # define M
    M = 4.5
    # define the number of dimensions to integrate up to.
    maxD = 10
    # integrate over a square of width twice of M, centered at the origin.
    for n in 1:maxD
        #loop over the dimensions, each time computing the integral
        a = -M*ones(n)
        b = M*ones(n)
        # specify the maximum number of evaluations.
        I,e = hcubature(f, a, b, maxevals = 10^7)
        # The result is a tuple of the integral value (I) and error (e).
        println("n = $(n), integral = $(I), error (estimate) = $(e)")
    end
end


if abspath(PROGRAM_FILE) == @__FILE__
    main_l0333_multiDimensionalIntegration()
end