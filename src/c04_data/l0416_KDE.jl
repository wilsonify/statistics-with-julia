# Kernel density estimation

using Random
using Distributions
using KernelDensity
using Plots; gr()

function main_l0416_KDE()
    # The first 12 lines are similar to the previous code example
    # with an exception of line 9 that defines the function mixPDF()
    # which is the PDF of the mixture distribution.
    Random.seed!(0)

    mu1, sigma1 = 10, 5
    mu2, sigma2 = 40, 12
    dist1, dist2 = Normal(mu1,sigma1), Normal(mu2,sigma2)
    p = 0.3
    mixRv() = (rand() <= p) ? rand(dist1) : rand(dist2)
    mixPDF(x) = p*pdf(dist1,x) + (1 - p) * pdf(dist2,x)

    n = 2000
    data = [mixRv() for _ in 1:n]

    kdeDist = kde(data)

    xGrid = -20:0.1:80
    # we invoke the function kde() to generate a KDE-type object kdeDist,based on data.
    # The KernelDensity package supplies methods for the pdf()
    # function that can be applied to UnivariateKDE objects such as kdeDist.
    # This is used in line 17 to create the array pdfKDE over xGrid.
    pdfKDE = pdf(kdeDist,xGrid)

    # plot the KDE, a histogram of the data, and the actual PDF.
    # These plots make up p1 which is the left hand of the figure.
    # The right hand side p2 is created in lines 25–32.
    plot(xGrid, pdfKDE, c = :blue, label = "KDE PDF")
    stephist!(data, bins = 50, c = :black, normed = :true, label = "Histogram")
    p1 = plot!(xGrid, mixPDF.(xGrid), c = :red, label = "Underlying PDF",
        xlims = (-20,80), ylims = (0,0.035), legend = :topleft,
        xlabel = "X", ylabel = "Density")

    hVals = [0.5, 2, 10]
    kdeS = [kde(data,bandwidth = h) for h in hVals]
    plot(xGrid, pdf(kdeS[1],xGrid), c = :green, label = "h=$(hVals[1])")
    plot!(xGrid, pdf(kdeS[2],xGrid), c = :blue, label = "h=$(hVals[2])")
    p2 = plot!(xGrid, pdf(kdeS[3],xGrid), c = :purple, label = "h=$(hVals[3])",
        xlims = (-20,80), ylims = (0,0.035), legend = :topleft,
        xlabel = "X", ylabel = "Density")
    plot(p1,p2,size = (800,400))
end

if abspath(PROGRAM_FILE) == @__FILE__
    main_l0416_KDE()
end