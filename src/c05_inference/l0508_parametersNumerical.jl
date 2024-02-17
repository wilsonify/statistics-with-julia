#=
the method of moments estimator is given by a numerical solution to
a straightforward (yet tedious) computation of the first three moment
given a series of observations,
estimate a, b and c useing the NLsolve package to numerically solve a system of equations
=#

using Random
using Distributions
using NLsolve # using the NLsolve package.
# NLsolve contains numerical methods for solving non-linear systems of equations.

using Random, Distributions, NLsolve
Random.seed!(0)

function m_k(k, data)
    n = length(data)
    return 1 / n * sum(data .^ k)
end

function sim_mHats(samples)
    return [m_k(i, samples) for i in 1:3]
end

function generate_data(a, b, c, n)
    dist = TriangularDist(a, b, c)
    return rand(dist, n)
end

function equations(F, x, mHats)
    F[1] = 1 / 3 * ( x[1] + x[2] + x[3] ) - mHats[1]
    F[2] = 1 / 6 * ( x[1]^2 + x[2]^2 + x[3]^2 + x[1] * x[2] + x[1] * x[3] + x[2] * x[3] ) - mHats[2]
    F[3] = 1 / 10 * ( x[1]^3 + x[2]^3 + x[3]^3 + x[1]^2 * x[2] + x[1]^2 * x[3] + x[2]^2 * x[1] + x[2]^2 * x[3] + x[3]^2 * x[1] + x[3]^2 * x[2] + x[1] * x[2] * x[3] ) - mHats[3]
end

function main_parameters_numerical()
    a, b, c = 3, 5, 4
    n = 2000
    samples = generate_data(a, b, c, n)
    mHats = sim_mHats(samples)
    result = nlsolve((F, x) -> equations!(F, x, mHats), [0.1, 0.1, 0.1])
    sol = sort(result.zero)
    return sol
end

using Test, Random, Distributions, NLsolve

@testset "m_k" begin
    Random.seed!(0)
    data = [1.0, 2.0, 3.0, 4.0, 5.0]
    result = m_k(2, data)
    @test round(result,digits = 2) == 11.0
end

@testset "sim_mHats" begin
    Random.seed!(0)
    samples = [1.0, 2.0, 3.0, 4.0, 5.0]
    result = sim_mHats(samples)
    result = round.(result,digits = 2)
    @test result == [3.0, 11.0, 45.0]
end

@testset "generate_data" begin
    Random.seed!(0)
    a, b, c, n = 3, 5, 4, 1000
    samples = generate_data(a, b, c, n)
    @test length(samples) == n
end

@testset "equations!" begin
    Random.seed!(0)
    x = [1.0, 2.0, 3.0]
    mHats = [3.0, 7.0, 18.7]
    F = similar(x)
    equations!(F, x, mHats)
    result = round.(F,digits=2)
    @test result == [-1.0, 1.33, 14.9]
end

@testset "end_to_end" begin
    Random.seed!(0)
    sol = main()
    @test round(sol[1], digits = 2) == 2.47
    @test round(sol[3], digits = 2) == 2.61
    @test round(sol[2], digits = 2) == 2.61
end

function main_l0508_parametersNumerical()
    # specify the parameters of the triangular distribution and the distribution itself dist.
    a, b, c = 3, 5, 4
    dist = TriangularDist(a,b,c)
    # specify the total number of samples n and generate our sample set of observations samples.
    n = 2000
    samples = rand(dist,n)

    # define function m_k()
    m_k(k, data) = 1 / n*sum(data.^k)

    # estimate the first three moments, given our observations samples.
    mHats = [m_k(i,samples) for i in 1:3]

    function equations(F, x)
        # set up the system of simultaneous equations.
        # for use with nlsovle()
        # takes two arrays as input, F and x.
        # The elements of F represent the left hand side of the series of equations
        # (which are later solved for zero),
        # and the elements of x represent the corresponding constants of the equations.
        # Note that in setting up the equations from (5.11),
        # the moment estimators are moved to the right hand side,
        # so that the zeros can be found.

        rhs1 = x[1] + x[2] + x[3]
        rhs2 = x[1]^2 + x[2]^2 + x[3]^2 + x[1] * x[2] + x[1] * x[3] + x[2] * x[3]
        rhs3_t1 = x[1]^3 + x[2]^3 + x[3]^3 + x[1]^2
        rhs3_t2 = x[2] + x[1]^2 * x[3] + x[2]^2
        rhs3_t3 = x[1] + x[2]^2 * x[3] + x[3]^2
        rhs3_t4 = x[1] + x[3]^2
        rhs3_t5 = x[2] + x[1]
        rhs3_t6 = x[2]
        rhs3_t7 = x[3]
        rhs3 = rhs3_t1  * rhs3_t2 * rhs3_t3 * rhs3_t4 * rhs3_t5 * rhs3_t6 * rhs3_t7
        F[1] = 1 / 3 * rhs1 - mHats[1]
        F[2] = 1 / 6 * rhs2 - mHats[2]
        F[3] = 1 / 10 * rhs3 - mHats[3]
    end


    Random.seed!(0)
    # solve the zeros of equations(),
    # initialize estimate to [0.1; 0.1; 0.1].
    # In this example, since the Jacobian was not specified, it is computed by finite differences.
    nlOutput = nlsolve(equations, [ 0.1; 0.1; 0.1])
    println(nlOutput)

    # note permuting these values does not change the equations.
    # when using a numerical solver,
    # there is a possibility that it will return an arbitrary permutation of the solutions.
    # remedy this by choosing a, b, and c in sorted order.
    # sort the solution (the zeros of our function)

    sol = sort(nlOutput.zero)
    aHat, bHat, cHat = sol[1], sol[3], sol[2]
    println("Found estimates for (a,b,c) = ", (aHat, bHat, cHat) , "\n" )
end