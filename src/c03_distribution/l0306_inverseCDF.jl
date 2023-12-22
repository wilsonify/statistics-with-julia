# The inverse CDF
using LaTeXStrings
using Plots
gr()
# we define the function infimum(),
# which implements similar logic to the mathematical operation inf().
# if input is empty it returns Inf, otherwise, the minimum value of the input.
# This agrees with the typical mathematical notation where the infimum of the empty set is ∞.
infimum(B) = isempty(B) ? Inf : minimum(B)
# define the inverse cumulative density function.
function invCDF(cdf, u)
    xGrid = 0:0.01:10
    # It first creates an array (representing a set) {x : F (x) ≥ u}
    # directly via the Julia filter() function.
    # Note that as a first argument, we use an anonymous Julia function, (x) − > (F(x) >= u).
    infinite_set = (x) -> (cdf(x) >= u)
    # We then use this function as a filter over xGrid.
    # Finally, we apply the infimum over this mathematical set
    # (represented by a vector of coordinates on the x-axis).
    finite_set = filter(infinite_set,xGrid)
    return infimum(finite_set)
end

function main_l0306_inverseCDF()
    # define the grid over which we will evaluate the CDF.
    xGrid = 0:0.01:10
    # define the grid over which we will evaluate the inverse CDF.
    uGrid = 0:0.01:1
    # define the time proportion during which the server is busy.
    busy = 0.8
    # define the cumulative density function F(t)
    # Note that for values less than zero, the CDF evaluates to 0.
    F_example(t) = t <= 0 ? 0 : 1 - busy*exp(-(1 - busy)t)
    # CDF, via the F() function,
    y1 = [F_example(x) for x in xGrid]
    # and the inverse CDF, via the invF() functions
    y2 = [invCDF(F_example,u) for u in uGrid]
    # Lines 12–18 are used to plot both the original
    p1 = plot(xGrid,y1, c = :blue, xlims = (-0.1,10), ylims = (0,1), xlabel = L"x", ylabel = L"F(x)")
    p2 = plot(uGrid,y2, c = :blue, xlims = (0,0.95), ylims = (0,maximum(xGrid)), xlabel = L"u", ylabel = L"F^{-1}(u)")
    plot(p1, p2, legend = :none, size = (800, 400))
end

if abspath(PROGRAM_FILE) == @__FILE__
    main_l0306_inverseCDF()
end

export infimum
export invCDF
