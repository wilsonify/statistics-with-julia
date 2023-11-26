# Descriptors of Distribution objects
import Pkg;
Pkg.add("Distributions")
using Distributions

function getDescriptors(dist)
    summmary_stats = Dict(
        :Parameters => params(dist),
        :CentralTendency => round.((mean(dist),median(dist)),digits=2),
        :Dispersion => round.((var(dist), std(dist)),digits=2),
        :HigherMomentShape => round.((skewness(dist),kurtosis(dist)),digits=2),
        :ValueRange => round.((minimum(dist),maximum(dist)),digits=2),
        :Mode => (mode(dist),modes(dist))
    )
    return summmary_stats
end

function main_l0310_distributionDescriptors()
    dist = TriangularDist(0,2,1)
    println("Parameters: \t\t\t",params(dist))
    println("Central descriptors: \t\t",mean(dist),"\t",median(dist))
    println("Dispersion descriptors: \t", var(dist),"\t",std(dist))
    println("Higher moment shape descriptors: ",skewness(dist),"\t",kurtosis(dist))
    println("Range: \t\t\t\t", minimum(dist),"\t",maximum(dist))
    println("Mode: \t\t\t\t", mode(dist), "\tModes: ",modes(dist))
end