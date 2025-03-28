# Bivariate normal data
using Distributions, Plots; gr()

function main_l0334_bivariateNormal()
    # include another Julia file defining meanVect and covMat.
    # mvParams.jl is generated by l0412
    include("$(@__DIR__)/../../data/mvParams.jl")
    # create bivariate distribution object
    biNorm = MvNormal(meanVect,covMat)
    N = 10^3
    # generate random points
    points = rand(MvNormal(meanVect,covMat),N)
    support = 15:0.5:40
    z = [ pdf(biNorm,[x, y]) for y in support, x in support ]
    # plots
    p1 = scatter(points[1, :], points[2, :], ms = 0.5, c = :black, legend = :none)
    # Notice the call to contour() with specified levels.
    p1 = contour!(support, support, z,  levels = [0.001, 0.005, 0.02], c = [:blue, :red, :green], xlims = (15,40), ylims = (15,40), ratio = :equal, legend = :none, xlabel = "x", ylabel = "y")
    # the parameters supplied via camera are horizontal rotation and vertical rotation in degrees.
    p2 = surface(support, support, z, lw = 0.1, c = cgrad([:blue, :red]), legend = :none, xlabel = "x", ylabel = "y",camera = (-35,20))
    plot(p1, p2, size = (800, 400))
end


if abspath(PROGRAM_FILE) == @__FILE__
    main_l0334_bivariateNormal()
end

export main_l0334_bivariateNormal