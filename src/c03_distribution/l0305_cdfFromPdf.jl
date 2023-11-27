# CDF from the Riemann sum of a PDF
using LaTeXStrings
using Plots; gr()
# In line 3, we deﬁne the function f2().
# The second set of parenthesis in the equation are used to ensure that the PDF is zero outside of the region [−1, 1]
# it evaluates to 0 everywhere else.
f2(x) = (x < 0 ? x + 1 : 1 - x) * (abs(x) < 1 ? 1 : 0)

# In line 7, we create a function that approximates the value of the CDF through a crude Riemann sum by evaluating the PDF at each point u, multiplying this by delta, and repeating this process
# for each progressively larger interval up to the speciﬁed value x. The total area is then approximated via the sum() function.
function approximate_CDF(pdf,x)
    a, b = -1.5, 1.5
    delta = 0.01
    return sum([pdf(u) * delta for u in a:delta:x])
end

function main_l0305_cdfFromPdf()
    # In lines 4 and 5, we set the limits of our integral, and the stepwise delta used.
    a, b = -1.5, 1.5
    delta = 0.01
    # In line 9, we specify the grid of values over which we will plot our approximated CDF.
    xGrid = a:delta:b
    # Line 10 uses the function F() to create the array y, which contains the actual approximation of the CDF over the grid of value speciﬁed.
    y = [approximate_CDF(f2, u) for u in xGrid]
    # Lines 11–12 are plotted in Figure 3.4.
    plot(xGrid, y, c = :blue, xlims = (a,b), ylims = (0,1), xlabel = L"x", ylabel = L"F(x)", legend = :none)
end