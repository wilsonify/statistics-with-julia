# Flooring an exponential random variable
using StatsBase, Distributions, Plots; gr()

function generate_exp_data(lambda, N)
    expDist = Exponential(1 / lambda)
    exp_sample = rand(expDist,N)
    return exp_sample
end

function generate_matching_geom_data(lambda, xGrid)
    # create a geometric distribution object with probability of success 1-e^-lambda.
    geomDist = Geometric(1 - MathConstants.e^-lambda)
    geomDistPdfData = pdf.(geomDist,xGrid)
    return geomDistPdfData
end

function process_exp_data(exp_sample)
    exp_sample_floored_float = floor.(exp_sample)
    exp_sample_floored_int = convert.(Int,exp_sample_floored_float)
    return exp_sample_floored_int
end

function get_proportions(exp_sample_floored_int, xGrid)
    N = length(exp_sample_floored_int)
    floorDataCounts = counts(exp_sample_floored_int, xGrid)
    floorData = floorDataCounts / N
    return floorData
end

function main_l0322_expGeom()
    lambda, N = 1, 10^6
    xGrid = 0:6
    # create the exponential distribution object, expDist.
    # Note that the function takes one argument, the inverse of the mean, hence 1/lambda.
    expDist = Exponential(1 / lambda)
    # sample N times from the exponential distribution.
    exp_sample = rand(expDist,N)
    # round each observation down to the nearest integer
    exp_sample_floored_float = floor.(exp_sample)
    # convert the values from Float64 to Int type.
    exp_sample_floored_int = convert.(Int,exp_sample_floored_float)
    # count how many times each integer in xGrid occurs
    floorDataCounts = counts(exp_sample_floored_int, xGrid)
    # normalize counts to proportions
    floorData = floorDataCounts / N
    # create a geometric distribution object with probability of success 1-MathConstants.e^-lambda.
    geomDist = Geometric(1 - MathConstants.e^-lambda)
    geomDistPdfData = pdf.(geomDist,xGrid)
    # plot the results where pdf() is applied to geomDist
    plot( xGrid, floorData, line = :stem, marker = :circle, c = :blue, ms = 10, msw = 0, lw = 4, label = "Floor of Exponential")
    plot!( xGrid, geomDistPdfData, line = :stem, marker = :xcross, c = :red, ms = 6, msw = 0, lw = 2, label = "Geometric", ylims = (0,1), xlabel = "x", ylabel = "Probability")
end


if abspath(PROGRAM_FILE) == @__FILE__
    main_l0322_expGeom()
end