#=
Histograms of sample means for different underlying distributions.

# It can be observed that for large N, these histograms approach that of a normal distribution,  and in addition,
# the mean of the data approaches the mean of the underlying distribution from which the samples were taken.

=#
using Distributions, Plots; gr()

n, N = 30, 10^6

function generate_uniform()
    dist = Uniform(1 - sqrt(3),1 + sqrt(3))
    data = [mean(rand(dist,n)) for _ in 1:N]
    return data
end

function generate_exponential()
    dist = Exponential(1)
    data = [mean(rand(dist,n)) for _ in 1:N]
    return data
end

function generate_normal()
    dist = Normal(1,1)
    data = [mean(rand(dist,n)) for _ in 1:N]
    return data
end

function main_l0506_centralLimitTheorem()
    n, N = 30, 10^6
    # define three different distribution type objects
    # a continuous uniform distribution over the domain [1 − 3, 1 + 3]
    dist1 = Uniform(1 - sqrt(3),1 + sqrt(3))
    # an exponential distribution with a mean of 1
    dist2 = Exponential(1)
    # a normal distribution with mean and standard deviation both 1.
    dist3 = Normal(1,1)

    # for each distribution, generate N sample means of n observations
    data1 = [mean(rand(dist1,n)) for _ in 1:N]
    data2 = [mean(rand(dist2,n)) for _ in 1:N]
    data3 = [mean(rand(dist3,n)) for _ in 1:N]

    # plot three separate histograms

    stephist(
        [data1 data2 data3],
        bins = 100,
        c = [:blue :red :green],
        xlabel = "x",
        ylabel = "Density",
        label = ["Average of Uniforms" "Average of Exponentials" "Average of Normals"],
        normed = true,
        xlims = (0,2),
        ylims = (0,2.5)
    )
end