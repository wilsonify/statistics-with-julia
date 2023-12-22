# moment generating function
# A sum of two triangular random variables
using Distributions, Statistics, Plots; gr()

# create two separate triangular distribution-type objects dist1 and dist2 and their matching densities f1(x) and f2(x).
# Note that the third argument of the TriangularDist() function
# is the location of the “peak” of the triangle or the mode of the distribution.
dist1 = TriangularDist(0,1,1)
dist2 = TriangularDist(0,1,0)

# implement the MGF function. estimating the sample mean of e^sZ for a specified s.
mgf(s) = 4(1 + (s - 1) * MathConstants.e^s) * (MathConstants.e^s - 1 - s) / s^4

# we define Point Estimate function which estimates the MGF at the point s.
mgfPointEst(s) = mean([MathConstants.e^(s*z) for z in  rand(dist1,20) + rand(dist2,20)])

function main_l0307_mgf()
    # purposefully only use 20 observations
    sGrid = -1:0.01:1
    N = 10^6
    # generate random observations from dist1 and dist2, store them separately in the two arrays
    data1 = rand(dist1,N)
    data2 = rand(dist2,N)
    # generate observations for Z by element-wise summation of the values in our arrays data1 and data2.
    dataSum = data1 + data2
    y1 = [mgfPointEst(s) for s in sGrid]
    y2 = [mgf(s) for s in sGrid]
    # use the data and functions to generate a figure
    p1 = histogram(dataSum, bins = 80, normed = :true, ylims = (0,1.4), xlabel = "z", ylabel = "PDF")
    p2 = plot(sGrid, y1, c = :blue, ylims = (0,3.5))
    p2 = plot!(sGrid, y2, c = :red)
    # plot the black line.
    p2 = plot!( [minimum(sGrid), maximum(sGrid)], [minimum(sGrid), maximum(sGrid)].+1, c = :black, xlabel = "s", ylabel = "MGF")
    plot(p1, p2, legend = :none, size = (800, 400))
end

if abspath(PROGRAM_FILE) == @__FILE__
    main_l0307_mgf()
end

