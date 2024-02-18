#=
Three ROCs for various points within the alternative hypothesis H1.
=#

using Distributions, StatsBase, LaTeXStrings, Plots; gr()
using Distributions, StatsBase, LaTeXStrings, Plots; gr()


function main_l0516_receiverOperatingCurve()
    mu0, mu1a, mu1b, mu1c, sd = 15, 16, 18, 20, 2
    # The range tauGrid represents the range of possible values for τ
    tauGrid = 5:0.1:25

    # dist0 is for H0
    dist0 = Normal(mu0,sd)
    # dist1a, dist1b, and dist1c are for three variants of H1 .
    dist1a, dist1b, dist1c  = Normal(mu1a,sd), Normal(mu1b,sd), Normal(mu1c,sd)


    # In this case, the probability of a Type I error is the same as the power.

    falsePositive = ccdf.(dist0,tauGrid)
    truePositiveA, truePositiveB, truePositiveC =
        ccdf.(dist1a,tauGrid), ccdf.(dist1b,tauGrid), ccdf.(dist1c,tauGrid)

    # create a parametric plot of falsePositives vs. truePositiveA, truePositiveB or truePositiveC.
    # use falsePositives for arguments of the horizontal coordinate
    # and truePositiveA, truePositiveB, or truePositiveC as arguments of the vertical coordinate.
    plot(
    falsePositive,
    [truePositiveA truePositiveB truePositiveC],
    c = [:blue :red :green],
    label = [L"H1a: \mu_1 = 16" L"H1b: \mu_1 = 18" L"H1c: \mu_1 = 20"]
    )

    # plot a diagonal dashed line.
    # This line represents the extreme case of the distributions of H0 and H1 directly overlapping.
    plot!([0, 1], [0, 1], c = :black, ls = :dash, label = "H0 = H1 = 15",
        xlims = (0,1), ylims = (0,1), xlabel = L"\alpha", ylabel = "Power",
        ratio = :equal, legend = :bottomright)

end