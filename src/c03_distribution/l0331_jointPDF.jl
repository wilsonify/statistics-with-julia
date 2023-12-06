# Visualizing a bivariate density
using LaTeXStrings, Measures
using Plots; gr()

# define the bivariate density function
f_poly(x, y) = 9 / 8 * (4x + y) * sqrt((1 - x) * (1 - y))

function twoD_Riemann_sum_over_density(xgrid, ygrid)
    delta = 0.01
    # evaluate the density over a grid of x-values and y-values.
    z = [f_poly(x,y) for y in ygrid, x in xgrid]
    # approximate the integral
    densityIntegral = sum(z) * delta^2
    return densityIntegral
end

function twoD_Riemann_sum_to_evaluate_probability(xgrid)
    # approximate nested integral as two Riemann sums
    delta = 0.01
    probB = sum([sum([f_poly(x,y) * delta for y in x:delta:1]) * delta for x in xgrid])
    return probB
end

function main_l0331_jointPDF()
    delta = 0.01
    grid = 0:delta:1
    z = [f_poly(x,y) for y in grid, x in grid]
    densityIntegral = sum(z) * delta^2
    println("2-dimensional Riemann sum over density: ", densityIntegral)
    probB = sum([sum([f_poly(x,y) * delta for y in x:delta:1]) * delta for x in grid])
    println("2-dimensional Riemann sum to evaluate probability: ", probB)
    # create Figure
    p1 = surface(grid, grid, z, c = cgrad([:blue, :red]), la = 1, camera = (60,50), ylabel = "y", zlabel = L"f_poly(x,y)", legend = :none)
    p2 = contourf(grid, grid, z,  c = cgrad([:blue, :red]))
    p2 = contour!(grid, grid, z,  c = :black, xlims = (0,1), ylims = (0,1), ylabel = "y", ratio = :equal)
    plot(p1, p2, size = (800, 400), xlabel = "x", margin = 5mm)
end

