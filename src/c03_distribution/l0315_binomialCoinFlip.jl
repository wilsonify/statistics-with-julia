# Coin ﬂipping and the binomial distribution
using StatsBase, Distributions, Plots; gr()

# define the binomial Randome Variable function.
# generate a binomial random variable from first principles
# create an array of uniform [0, 1] values of length n.
# compare each value (element-wise) to p.
# The result is a vector of Booleans, with each one set to true with probability p.
# Summing up this vector creates the binomial random variable.
binomialRV(n, p) = sum(rand(n) .< p)

function main_l0315_binomialCoinFlip()
    p, n, N = 0.5, 10, 10^6
    bDist = Binomial(n,p)
    xGrid = 0:n
    # create a vector incorporating the values of the binomial PMF.
    # Note that in the Julia distributions package, PMFs are created via pdf().
    bPmf = [pdf(bDist,i) for i in xGrid]
    # generate N random values.
    data = [binomialRV(n,p) for _ in 1:N]
    # count how may times each outcome occurred, for 0:n heads.
    # normalize via division by N.
    pmfEst = counts(data,0:n) / N
    # create the plot.
    plot( xGrid, pmfEst,  line = :stem, marker = :circle, c = :blue, ms = 10, msw = 0, lw = 4, label = "MC estimate")
    plot!( xGrid, bPmf,  line = :stem, marker = :xcross, c = :red, ms = 6, msw = 0, lw = 2, label = "PMF", xticks = (0:1:10), ylims = (0,0.3), xlabel = "x", ylabel = "Probability")
end

