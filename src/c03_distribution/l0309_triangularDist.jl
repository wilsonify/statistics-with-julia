# Using the pdf(), cdf(), and quantile() functions with Distributions
using Distributions, LaTeXStrings, Plots; gr()

function TriangularPDF(a, b, c)
    dist = TriangularDist(a,b,c)
    xGrid = a:0.01:b
    return pdf.(dist,xGrid)
end

function TriangularCDF(a, b, c)
    dist = TriangularDist(a,b,c)
    xGrid = a:0.01:b
    return cdf.(dist,xGrid)
end

function TriangularInvCDF(a, b, c)
    dist = TriangularDist(a,b,c)
    uGrid = 0:0.01:1
    return quantile.(dist,uGrid)
end

function main_l0309_triangularDist()
    # use the TriangularDist() function to create a distribution-type object.
    # The first two arguments are the start and end points of the support,
    # the third argument is the location of the “peak” (or mode).
    dist = TriangularDist(0,2,1)
    xGrid = 0:0.01:2
    uGrid = 0:0.01:1
    # the pdf() using dist and the broadcast operator, “.”
    y1 = pdf.(dist,xGrid)
    # cdf() using dist and the broadcast operator, “.”
    y2 = cdf.(dist,xGrid)
    # quantile() using dist and the broadcast operator, “.”
    y3 = quantile.(dist,uGrid)
    p1 = plot( xGrid, y1, c = :blue, xlims = (0,2), ylims = (0,1.1), xlabel = "x", ylabel = "f(x)")
    p2 = plot( xGrid, y2, c = :blue, xlims = (0,2), ylims = (0,1), xlabel = "x", ylabel = "F(x)")
    p3 = plot( uGrid, y3, c = :blue, xlims = (0,1), ylims = (0,2), xlabel = "u", ylabel = (L"F^{-1}(u)"))
    plot(p1, p2, p3, legend = false, layout = (1,3), size = (1200, 400))
end

if abspath(PROGRAM_FILE) == @__FILE__
    main_l0309_triangularDist()
end