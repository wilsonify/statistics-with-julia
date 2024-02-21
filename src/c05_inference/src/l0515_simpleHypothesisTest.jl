#=
Type I (blue) and Type II (green) errors.
The rejection region based from τ = 17.5
to the right is colored with red on the horizontal axis.
=#
using Random
using Distributions
using StatsBase
using Plots; gr()

function compute_type_I_error(mu0, sd, tau)
    # compute α using ccdf(dist0)
    dist0 = Normal(mu0, sd)
    return round(ccdf(dist0, tau), digits=2)
end

function compute_type_II_error(mu1, sd, tau)
    # compute β using cdf(dist1)
    dist1 = Normal(mu1, sd)
    return round(cdf(dist1, tau), digits=2)
end

function plot_hypothesis_test(mu0, mu1, sd, tau)
    dist0 = Normal(mu0, sd)
    dist1 = Normal(mu1, sd)
    # grids of values that are used for plotting type I and type II error ranges.
    grid = 5:0.1:25
    h0grid, h1grid = tau:0.1:25, 5:0.1:tau

    p1 = plot(grid, pdf.(dist0, grid), c=:blue, label="Bolt type 15g")
    plot!(p1, h0grid, pdf.(dist0, h0grid), c=:blue, fa=0.2, fillrange=[0, 1], label="")
    plot!(p1, grid, pdf.(dist1, grid), c=:green, label="Bolt type 18g")
    plot!(p1, h1grid, pdf.(dist1, h1grid), c=:green, fa=0.2, fillrange=[0, 1], label="")
    plot!(p1, [tau, 25], [0, 0], c=:red, lw=3, label="Rejection region",
          xlims=(5, 25), ylims=(0, 0.25), legend=:topleft, xlabel="x", ylabel="Density")
    annotate!(p1, [(16, 0.02, text(L"\beta")), (18.5, 0.02, text(L"\alpha")),
                   (15, 0.21, text(L"H_0")), (18, 0.21, text(L"H_1"))])

    return p1
end

function main_l0515_simpleHypothesisTest()
    # set the parameters of the example.
    mu0, mu1, sd, tau  = 15, 18, 2, 17.5
    # define the distributions under H0 and H1 .
    dist0, dist1 = Normal(mu0,sd), Normal(mu1,sd)

    # grids of values that are used for plotting type I and type II error ranges.
    grid = 5:0.1:25
    h0grid, h1grid = tau:0.1:25, 5:0.1:tau

    # compute α using ccdf(dist0)
    alpha_risk = ccdf(dist0,tau)
    # compute β using cdf(dist1)
    beta_risk = cdf(dist1,tau)
    println("Probability of Type I error: ", alpha_risk)
    println("Probability of Type II error: ", beta_risk)

    # create the figure
    y1=pdf.(dist0,grid)
    y2=pdf.(dist0, h0grid)
    y3=pdf.(dist1,grid)
    y4=pdf.(dist1, h1grid)
    # Notice the calls to plot!() in lines 13–14 and 17–18 using the fillrange argument.

    plot(
    grid,
    y1,
    c = :blue,
    label = "Bolt type 15g"
    )
    plot!(
    h0grid,
    y2,
    c = :blue,
    fa = 0.2,
    fillrange = [0 1],
    label = ""
    )
    plot!(
    grid,
    y3,
    c = :green,
    label = "Bolt type 18g"
    )
    plot!(
    h1grid,
    y4,
    c = :green,
    fa = 0.2,
    fillrange = [0 1],
    label = ""
    )

    plot!(
    [tau, 25],
    [0, 0],
    c = :red,
    lw = 3,
    label = "Rejection region",
    xlims = (5, 25),
    ylims = (0,0.25) ,
    legend = :topleft,
    xlabel = "x",
    ylabel = "Density"
    )
    annotate!([
    (16, 0.02, text(L"\beta")),
    (18.5, 0.02, text(L"\alpha")),
    (15, 0.21, text(L"H_0")),
    (18, 0.21, text(L"H_1"))
    ])
end


