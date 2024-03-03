#=
Q-Q plots of T-statistics from identical experiments,
given Satterthwaite calculated v’s,
along with T-statistics given constant v.

The Satterthwaite approximation is a better approximation
than degrees of freedom.
=#

using Distributions
using Statistics
using Random
using Plots; gr()

# define the Satterthwaite approximation
df(s1, s2, n1, n2) = (s1^2 / n1 + s2^2 / n2)^2 / ( (s1^2 / n1)^2 / (n1 - 1) + (s2^2 / n2)^2 / (n2 - 1) )

# the inverse probability transform on the degrees of freedom
# Note that the number of quantiles is one more than the number of experiments, i.e. N+1.
invVal(v, i, N) = quantile(TDist(v),i / (N + 1))

function compute_tdArray(N)
    tdArray = Array{Tuple{Float64,Float64}}(undef,N)
    for i in 1:N
        x1Data = rand(dist1, n1)
        x2Data = rand(dist2, n2)
        x1Bar,x2Bar = mean(x1Data),mean(x2Data)
        s1,s2 = std(x1Data),std(x2Data)
        tStat = (x1Bar - x2Bar) / sqrt(s1^2 / n1 + s2^2 / n2)
        tdArray[i] = (tStat , df(s1,s2,n1,n2))
    end

    sort!(tdArray, by = first)
    return tdArray
end

function compute_coords(tdArray)
    xCoords = Array{Float64}(undef,N)
    yCoords1 = Array{Float64}(undef,N)
    yCoords2 = Array{Float64}(undef,N)
    for i in 1:N
        xCoords[i] = first(tdArray[i])
        yCoords1[i] = invVal(last(tdArray[i]), i,N)
        yCoords2[i] = invVal(n1 + n2 - 2, i,N)
    end
    return xCoords, yCoords1, yCoords2
end

function main_l0606_vDOF_comparison()
    Random.seed!(0)
    # set the means and standard deviations of the two underlying distributions,
    # set the number of observations that will be made for each group.
    mu1, sig1, n1 = 0, 2, 8
    mu2, sig2, n2 = 0, 30, 15
    dist1 = Normal(mu1, sig1)
    dist2 = Normal(mu2, sig2)
    # set the number of times we repeat the experiment
    N = 10^6

    # allocate an array of tuples (T-statistic, degrees of freedom)
    tdArray = Array{Tuple{Float64,Float64}}(undef,N)

    # conduct N experiments
    for i in 1:N
        # for each experiment calculate the T-statistic and the degrees of freedom.
        x1Data = rand(dist1, n1)
        x2Data = rand(dist2, n2)
        x1Bar,x2Bar = mean(x1Data),mean(x2Data)
        s1,s2 = std(x1Data),std(x2Data)
        tStat = (x1Bar - x2Bar) / sqrt(s1^2 / n1 + s2^2 / n2)
        tdArray[i] = (tStat , df(s1,s2,n1,n2))
    end

    # sort ascending by T-statistic, so that we can construct the Q-Q plot.
    sort!(tdArray, by = first)

    # xCoords represents the T-statistic quantiles,
    xCoords = Array{Float64}(undef,N)
    # yCoords1 represents the quantiles of a T-distribution with v degrees of freedom, v is calculated via df()
    yCoords1 = Array{Float64}(undef,N)
    # yCoords2 represents the quantiles of a T-distribution with v degrees of freedom, where v = n1 + n2 − 2.
    yCoords2 = Array{Float64}(undef,N)
    for i in 1:N
        # calculate the quantiles of our data
        xCoords[i] = first(tdArray[i])
        yCoords1[i] = invVal(last(tdArray[i]), i,N)
        yCoords2[i] = invVal(n1 + n2 - 2, i,N)
    end

    # plot the Q-Q plots
    scatter(xCoords, yCoords1, c = :blue, label = "Calculated v", msw = 0)
    scatter!(xCoords, yCoords2, c = :red, label = "Fixed v", msw = 0)
    plot!([-10, 10], [-10, 10],
         c = :black, lw = 0.3, xlims = (-8,8), ylims = (-8,8), ratio = :equal, label = "",
         xlabel = "Theoretical t-distribution quantiles",
         ylabel = "Simulated t-distribution quantiles", legend = :topleft)

end



