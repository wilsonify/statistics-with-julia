# Uniformly distributed angles
using Distributions, LaTeXStrings, Plots; gr()



function main_l0321_continuousUniform()
    # create a continuous uniform distribution over the domain [0, 2π].
    cUnif = Uniform(0,2π)
    # In Julia you can use the Unicode character π or pi.
    xGrid = 0:0.1:2π
    N = 10^6
    # generate N uniform random values on [0, 2π].
    # An alternative would be to use rand(cUnif,N).
    # simulate N continuous uniform random variables over the domain [0, 1], scale each by 2π.
    y1 = rand(N) * 2π
    # use pdf() on the distribution object cUnif to compute the analytic PDF.
    y2 = pdf.(cUnif,xGrid)
    # plot a histogram of this data
    # Notice that the bins argument is set to the range xGrid.
    # An alternative would be to specify an integer number of bins.
    stephist( y1, bins = xGrid, normed = :true, c = :blue, label = "MC Estimate")
    # Notice the use of L from the LaTexStrings package for creating formulas
    plot!( xGrid, y2, c = :red,ylims = (0,0.2),label = "PDF", ylabel = "Density",xticks = ([0:π / 2:2π; ], ["0", L"\dfrac{\pi}{2}", L"\pi", L"\dfrac{3\pi}{2}", L"2\pi"]))
end

if abspath(PROGRAM_FILE) == @__FILE__
    main_l0321_continuousUniform()
end

export main_l0321_continuousUniform