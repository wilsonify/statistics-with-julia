# Bivariate normal data
using Distributions, Plots; gr()

#=

In line 3, we include another Julia ﬁle deﬁning meanVect and covMat. This ﬁle is generated in List-
ing 4.12 of Chapter 4. In line 4, we create an MvNormal distribution object representing the bivariate
distribution. In line 7, we use rand() with a method provided via the Distributions package
to generate random points. The rest of the code plots are shown in Figure 3.26. Notice the call to
contour() in lines 13–16, with speciﬁed levels. In lines 17–18, the parameters supplied via camera
are horizontal rotation and vertical rotation in degrees.

=#
function main_l0334_bivariateNormal()
    include("../../data/mvParams.jl")
    biNorm = MvNormal(meanVect,covMat)
    N = 10^3
    points = rand(MvNormal(meanVect,covMat),N)
    support = 15:0.5:40
    z = [ pdf(biNorm,[x, y]) for y in support, x in support ]
    p1 = scatter(points[1, :], points[2, :], ms = 0.5, c = :black, legend = :none)
    p1 = contour!(support, support, z,  levels = [0.001, 0.005, 0.02], c = [:blue, :red, :green], xlims = (15,40), ylims = (15,40), ratio = :equal, legend = :none, xlabel = "x", ylabel = "y")
    p2 = surface(support, support, z, lw = 0.1, c = cgrad([:blue, :red]), legend = :none, xlabel = "x", ylabel = "y",camera = (-35,20))
    plot(p1, p2, size = (800, 400))
end

# Bivariate normal data
using Distributions, Plots
path_to_here = @__DIR__
path_to_data = abspath("$path_to_here/../../data")
include("$path_to_data/mvParams.jl")
using Test
@testset "end_to_end" begin
biNorm = MvNormal(meanVect,covMat)

N = 10^3
points = rand(MvNormal(meanVect,covMat),N)

support = 15:0.5:40
z = [ pdf(biNorm,[x, y]) for y in support, x in support ]

p1 = scatter(points[1, :], points[2, :], ms = 0.5, c = :black, legend = :none)
p1 = contour!(support, support, z,
        levels = [0.001, 0.005, 0.02], c = [:blue, :red, :green],
        xlims = (15,40), ylims = (15,40), ratio = :equal, legend = :none,
        xlabel = "x", ylabel = "y")
p2 = surface(support, support, z, lw = 0.1, c = cgrad([:blue, :red]),
         legend = :none, xlabel = "x", ylabel = "y",camera = (-35,20))

plot(p1, p2, size = (800, 400))
end