# Roots of a polynomial
using Roots

function polynomialGenerator(a...)
    n = length(a) - 1
    poly = function(x)
                return sum([a[i + 1] * x^i for i in 0:n])
            end
    return poly
end

function main_polyroot()
    polynomial = polynomialGenerator(1,3,-10)
    zeroVals = find_zeros(polynomial,-10,10)
    println("Zeros of the function f(x): ", zeroVals)
end

if abspath(PROGRAM_FILE) == @__FILE__
    main_polyroot
end

export polynomialGenerator
export find_zeros
