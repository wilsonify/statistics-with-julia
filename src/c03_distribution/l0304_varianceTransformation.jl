# Variance of X as the mean of Y

# Line 1 calls the Distributions package. This package supports a variety of distribution types
using Distributions, Plots; gr()

function variance_transform(data)
    return (data .- mean(data)).^2
end

function main_l0304_varianceTransformation()
    # Line 2 uses the Triangular() function from the Distributions package to create a triangular distribution-type object with a mean of 5 and a symmetric shape over the bound [4, 6].
    dist = TriangularDist(4,6,5)
    N = 10^6
    # In line 5, we generate an array of N observations from the distribution
    # by applying the rand() function on the distribution dist.
    data = rand(dist,N)
    # Line 6 takes the observations in data and from them generates observations for the new random variable Y .
    yData = variance_transform(data)
    # Line 8 uses the functions mean() and var() on the arrays yData and data, respectively.
    # It can be seen from the output that the mean of the distribution Y is the same as the variance of X.
    println("Mean: ", mean(yData), " Variance: ", var(data))
    # Lines 10–12 are used to plot histograms of the data in the arrays data and yData.
    # It can be observed that the histogram on the left approximates the PDF of our triangular distribution,
    # while the histogram on the right approximates the distribution of the new variable Y .
    # The distribution of Y is seldom considered when evaluating the variance of X.
    p1 = histogram(data, xlabel = "x", bins = 80, normed = true, ylims = (0,1.1))
    p2 = histogram(yData, xlabel = "y", bins = 80, normed = true, ylims = (0,15))
    plot(p1, p2, ylabel = "Proportion", size = (800, 400), legend = :none)
end