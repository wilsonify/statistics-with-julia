# Plotting discrete and continuous distributions
using Measures
using Plots; gr()
pContinuous(x) = 3 / 4 * (1 - x^2)
pContinuous2(x) = x < 0 ? x + 1 : 1 - x

function main_l0302_discreteContinuous()
    pDiscrete = [0.25, 0.25, 0.5]
    xGridD = 0:2
    xGridC = -1:0.01:1
    p1 = plot(xGridD, line = :stem, pDiscrete, marker = :circle, c = :blue, ms = 6, msw = 0)
    p2 = plot(xGridC, pContinuous.(xGridC), c = :blue)
    p3 = plot(xGridC, pContinuous2.(xGridC), c = :blue)
    plot(p1, p2, p3, layout = (1,3), legend = false, ylims = (0,1.1), xlabel = "x", ylabel = ["Probability" "Density" "Density"], size = (1200, 400), margin = 5mm)
end

if abspath(PROGRAM_FILE) == @__FILE__
    main_l0302_discreteContinuous()
end

export pContinuous
export pContinuous2

