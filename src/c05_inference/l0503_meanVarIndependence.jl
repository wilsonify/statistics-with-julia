#=
Pairs of X_bar and S^2 for standard uniform (left) and standard normal (right).
for statistics calculated from the same sample,
and statistics calculated from separate samples.
=#

using Distributions, LaTeXStrings, Plots; gr()

function statPair(dist, n)
    # takes a distribution and integer n as input,
    # returns the sample mean and sample variance as an array.
    sample = rand(dist,n) # generate a random sample of size n
    [mean(sample), var(sample)]
end

function main_l0503_meanVarIndependence()
    # define the standard uniform distribution mean of zero and standard deviation of one.
    stdUni = Uniform(-sqrt(3),sqrt(3))
    # set the number of observations for each sample n
    # set the number of sample groups N
    n, N = 3, 10^5

    # calculate N pairs of sample means and variances from N sample groups.
    # Note sampled from stdUni; the output is an array of arrays.
    dataUni = [statPair(stdUni,n) for _ in 1:N]
    dataUni_first = first.(dataUni)
    dataUni_last = last.(dataUni)

    # calculate from two separate sample groups N times.
    dataUniInd = [[mean(rand(stdUni,n)), var(rand(stdUni,n))] for _ in 1:N]
    dataUniInd_first = first.(dataUniInd)
    dataUniInd_last = last.(dataUniInd)

    # do the same from a standard normal distribution
    dataNorm = [statPair(Normal(),n) for _ in 1:N]
    dataNorm_first = first.(dataNorm)
    dataNorm_last = last.(dataNorm)

    dataNormInd = [[mean(rand(Normal(),n)), var(rand(Normal(),n))] for _ in 1:N]
    dataNormInd_first = first.(dataNormInd)
    dataNormInd_last = last.(dataNormInd)

    p1 = scatter(dataUni_first, dataUni_last, c = :blue, ms = 1, msw = 0, label = "Same group")
    p1 = scatter!(dataUniInd_first, dataUniInd_last, c = :red, ms = 0.8, msw = 0, label = "Separate group", xlabel = L"\overline{X}", ylabel = L"S^2")

    p2 = scatter(dataNorm_first, dataNorm_last, c = :blue, ms = 1, msw = 0, label = "Same group")
    p2 = scatter!(dataNormInd_first, dataNormInd_last, c=:red, ms=0.8, msw=0, label="Separate group", xlabel=L"\overline{X}", ylabel=L"$S^2$")

    plot(p1, p2, ylims=(0,5), size=(800, 400))
end