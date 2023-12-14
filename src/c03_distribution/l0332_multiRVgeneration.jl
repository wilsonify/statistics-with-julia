# Generating random vectors with desired mean and covariance

using Distributions, LinearAlgebra, LaTeXStrings, Random, Plots; gr()

function standard_normal_generator()
    # standard normal
    return rand(Normal())
    end

function uniform_generator()
    # uniform on [− 3, 3]
    return rand(Uniform(-sqrt(3),sqrt(3)))
    end

function shifted_exponential_generator()
    # unit exponential shifted by −1
    return rand(Exponential()) - 1
    end

function affine_transformation(rg)
    A * [rg(), rg()] + muY
end

function generate_random_vectors_with_desired_mean_and_covariance(muY, SigY)
    # compute a lower triangular matrix A where sum(Y) = A . transpose(A)
    A = cholesky(SigY).L
    # define an array of functions
    # each element generates a scalar random variable with zero mean and unit variance.
    rngGens = [ standard_normal_generator, uniform_generator, shifted_exponential_generator ]

    # input a function to generate a random value and then implement the affine transformation.
    rv(rg) = A * [rg(), rg()] + muY

    # we create an array of three arrays, with each internal array consisting of N two-dimensional random vectors.
    data = [[rv(r) for _ in 1:N] for r in rngGens]
    return data
    end

function stats(data)
    # calculates and prints ﬁrst and second-order statistics.
    # Note the use of begin and end to define the function.
    data1, data2 = first.(data), last.(data)
    println("Mean1\tMean2\tVar1\tVar2\tCov")
    println(
    round(mean(data1),digits = 2),
     "\t",round(mean(data2),digits = 2),"\t",
     round(var(data1),digits = 2), "\t",
      round(var(data2),digits = 2), "\t",
      round(cov(data1,data2),digits = 2)
      )
    end

function main_l0332_multiRVgeneration()
    Random.seed!(1)
    N = 10^5
    # define the covariance matrix
    SigY = [ 6 4 ; 4 9]
    # and the mean vector
    muY = [15 ; 20]
    # generate data with mu and sigma
    data = generate_random_vectors_with_desired_mean_and_covariance(muY,SigY)
    # printing output.
    stats(data)
    # create Figure
    scatter(first.(data[1]), last.(data[1]), c = :blue, ms = 1, msw = 0, label = "Normal")
    scatter!(first.(data[2]), last.(data[2]), c = :red, ms = 1, msw = 0, label = "Uniform")
    scatter!(first.(data[3]), last.(data[3]), c = :green, ms = 1, msw = 0, label = "Exponential", xlims = (0,40), ylims = (0,40), legend = :bottomright, ratio = :equal, xlabel = L"X_1", ylabel = L"X_2")
    end

