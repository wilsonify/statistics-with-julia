#=
As the number of degrees of freedom (DOF) increases,
the T-distribution approaches that of the normal distribution.
=#

using Distributions, Random, Plots; gr()
Random.seed!(0)

n, N, alpha = 3, 10^7, 0.1

function myT(nObs)
    # generates a T-distributed random variable
    # using a standard normal and a chi-squared random variable.
    dof = (nObs - 1)
    numer = rand(Normal())
    denom = sqrt(rand(Chisq(dof)) / dof )
    return numer / denom
end

function main_l0504_tDistribution()
    # estimate the alpha quantile using N replications
    mcQuantile = quantile([myT(n) for _ in 1:N],alpha)

    # compute the quantile analytically for a corresponding T-distribution represented by TDist(n-1).
    analyticQuantile = quantile(TDist(n - 1),alpha)

    println("Quantile from Monte Carlo: ", mcQuantile)
    println("Analytic qunatile: ", analyticQuantile)

    # plot three T-distributions
    xGrid = -5:0.1:5
    y1 = pdf.(Normal(), xGrid)
    y2 = pdf.(TDist(1) ,xGrid)
    y3 = pdf.(TDist(3) , xGrid)
    y4 = pdf.(TDist(100),xGrid)
    plot(xGrid, y1, c = :black, label = "Normal Distribution")
    scatter!(xGrid, y2, c = :blue, msw = 0, label = "DOF = 1")
    scatter!(xGrid, y3, c = :red, msw = 0, label = "DOF = 3")
    scatter!(xGrid, y4, c = :green, msw = 0, label = "DOF = 100", xlims = (-4,4), ylims = (0,0.5), xlabel = "X", ylabel = "Density")
end