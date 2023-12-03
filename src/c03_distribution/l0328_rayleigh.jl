#=
Alternative representations of Rayleigh random variables

the Rayleigh distribution is related to the exponential distribution via a square root transformation.
Hence, the implication is that since we know how to generate exponential random variables,
then by applying a square root we can generate Rayleigh random variables.

the Rayleigh distribution is related to Rayleigh fading,
a statistical model used in radio communications.
=#
using Distributions, Random

function generate_rayleigh_data1(N, sig)
    return sqrt.(-(2 * sig^2) * log.(rand(N)))
end
function generate_rayleigh_data2(N, sig)
    distG = Normal(0,sig)
    return sqrt.(rand(distG,N).^2 + rand(distG,N).^2)
end
function generate_rayleigh_data3(N, sig)
    distR = Rayleigh(sig)
    return rand(distR,N)
end

function main_l0328_rayleigh()
    Random.seed!(1)
    N = 10^6
    sig = 1.7

    # generate data. use element-wise mapping of sqrt() and log().
    data1 = sqrt.(-(2 * sig^2) * log.(rand(N)))

    # generate data another way. apply rand() to the normal distribution
    distG = Normal(0,sig)
    data2 = sqrt.(rand(distG,N).^2 + rand(distG,N).^2)

    # generate data another way. sample the Rayleigh distribution
    distR = Rayleigh(sig)
    data3 = rand(distR,N)

    # the sample mean is very similar to the theoretical mean.
    mean.([data1, data2, data3])
end

