# The law of large numbers breaks down with very heavy tails
using Random, Plots; pyplot()

function main()
Random.seed!(808)

n = 10^6
data = tan.(rand(n) * pi .- pi / 2)
averages = accumulate(+,data)./collect(1:n)

plot( 1:n, averages, 
    c = :blue, legend = :none,
    xscale = :log10, xlims = (1,n), xlabel = "n", ylabel = "Running average")
end