#=
Q-Q plots of T-statistics from identical experiments,
given Satterthwaite calculated v’s,
along with T-statistics given constant v.

The Satterthwaite approximation is a better approximation
than degrees of freedom.


# In lines 4–5, we set the means and standard deviations of the two underlying distributions, and the number of observations that will be made for each group.
#
# In line 8, we set the number of times we repeat the experiment, N.
#
# In line 9, we pre-allocate the array tdArray, in which each element is a tuple.
# The ﬁrst element of each tuple will be the T-statistic calculated via (6.11),
# while the second will be the corresponding degrees of freedom calculated via (6.12).
#
# In lines 12–13, we deﬁne the function df(), which implements (6.12).
#
# In lines 15–22, we conduct N experiments, where for each, we calculate the T-statistic and the degrees of freedom.
#
# In line 23, sort!() is used to re-order tdArrray in ascending order according to the T-statistics via by = first.
# This is done so that we can construct the Q-Q plot.
#
# In line 25, the function invVal() is deﬁned,
# which uses the quantile() function to perform the inverse probability transform on the degrees of freedom associated with each T-statistic for each experiment.
#
# Note that the number of quantiles is one more than the number of experiments, i.e. N+1.
#
# In lines 31-35, the quantiles of our data are calculated.
# Here, xCoords represents the T-statistic quantiles,
# and yCoords1 represents the quantiles of a T-distribution with v degrees of freedom,
# where v is calculated via (6.12).
#
# The array yCoords2, on the other hand, represents the quantiles of a T-distribution with v degrees of freedom,
# where v = n1 + n2 − 2.
#
# Lines 37–42 plot the Q-Q plots creating Listing 6.6.
=#

using Distributions, Statistics, Random, Plots; gr()
Random.seed!(0)

mu1, sig1, n1 = 0, 2, 8
mu2, sig2, n2 = 0, 30, 15
dist1 = Normal(mu1, sig1)
dist2 = Normal(mu2, sig2)

N = 10^6
tdArray = Array{Tuple{Float64,Float64}}(undef,N)

df(s1,s2,n1,n2) =
    (s1^2/n1 + s2^2/n2)^2 / ( (s1^2/n1)^2/(n1-1) + (s2^2/n2)^2/(n2-1) )

for i in 1:N
    x1Data = rand(dist1, n1)
    x2Data = rand(dist2, n2)
    x1Bar,x2Bar = mean(x1Data),mean(x2Data)
    s1,s2 = std(x1Data),std(x2Data)
    tStat = (x1Bar - x2Bar) / sqrt(s1^2/n1 + s2^2/n2)
    tdArray[i] = (tStat , df(s1,s2,n1,n2))
end
sort!(tdArray, by = first)

invVal(v,i) = quantile(TDist(v),i/(N+1))

xCoords  = Array{Float64}(undef,N)
yCoords1 = Array{Float64}(undef,N)
yCoords2 = Array{Float64}(undef,N)

for i in 1:N
    xCoords[i] = first(tdArray[i])
    yCoords1[i] = invVal(last(tdArray[i]), i)
    yCoords2[i] = invVal(n1+n2-2, i)
end

scatter(xCoords, yCoords1, c=:blue, label="Calculated v", msw=0)
scatter!(xCoords, yCoords2, c=:red, label="Fixed v", msw=0)
plot!([-10,10], [-10,10],
	 c=:black, lw=0.3, xlims=(-8,8), ylims=(-8,8), ratio=:equal, label="", 
	 xlabel="Theoretical t-distribution quantiles", 
	 ylabel="Simulated t-distribution quantiles", legend=:topleft)




using Distributions, Statistics, Random, Plots; gr()

Random.seed!(0)
N = 10^6
mu1, sig1, n1 = 0, 2, 8
mu2, sig2, n2 = 0, 30, 15
dist1 = Normal(mu1, sig1)
dist2 = Normal(mu2, sig2)

df(s1, s2, n1, n2) = (s1^2 / n1 + s2^2 / n2)^2 / ( (s1^2 / n1)^2 / (n1 - 1) + (s2^2 / n2)^2 / (n2 - 1) )
invVal(v, i) = quantile(TDist(v),i / (N + 1))

function compute_tdArray()
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
    yCoords1[i] = invVal(last(tdArray[i]), i)
    yCoords2[i] = invVal(n1 + n2 - 2, i)
end
return xCoords, yCoords1, yCoords2
end

using Test
@testset "compute_tdArray" begin
    result = compute_tdArray()
    @test length(result) == N
end

@testset "end_to_end" begin
tdArray = compute_tdArray()
xCoords, yCoords1, yCoords2 = compute_coords(tdArray)
scatter(xCoords, yCoords1, c = :blue, label = "Calculated v", msw = 0)
scatter!(xCoords, yCoords2, c = :red, label = "Fixed v", msw = 0)
plot!([-10, 10], [-10, 10],
     c = :black, lw = 0.3, xlims = (-8,8), ylims = (-8,8), ratio = :equal, label = "",
     xlabel = "Theoretical t-distribution quantiles",
     ylabel = "Simulated t-distribution quantiles", legend = :topleft)
end