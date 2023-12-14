# Multidimensional integration
using HCubature

#=
We use the HCubature package. In line 3, we deﬁne M. Then the integration is performed over a square
of width twice of M, centered at the origin. In line 4, we deﬁne maxD as the number of dimensions up
to which we wish to carry out integration. The function deﬁnition in line 6 implements (3.32). We
loop over the dimensions in lines 8–13, each time computing the integral in line 11 where we specify
maxevals as the maximum number of evaluations. The result is a tuple of the integral value and error,
which are assigned to I and e, respectively.
=#
function main_l0333_multiDimensionalIntegration()
    M = 4.5
    maxD = 10
    f(x) = (2 * pi)^(-length(x) / 2) * exp(-(1/2)*x'x)
    for n in 1:maxD
        a = -M*ones(n)
        b = M*ones(n)
        I,e = hcubature(f, a, b, maxevals = 10^7)
        println("n = $(n), integral = $(I), error (estimate) = $(e)")
    end
end

# Multidimensional integration
using HCubature
using Test
@testset "end_to_end" begin
M = 4.5
maxD = 10

f(x) = (2 * pi)^(-length(x) / 2) * exp(-(1/2)*x'x)

for n in 1:maxD
    a = -M*ones(n)
    b = M*ones(n)
    I,e = hcubature(f, a, b, maxevals = 10^7)
    println("n = $(n), integral = $(I), error (estimate) = $(e)")
end
end