# Secretary with envelopes

using StatsBase
using Combinatorics

function bruteSetsProbabilityAllMiss(n)
    omega = collect(permutations(1:n))
    matchEvents = []
    for i in 1:n
        event = []
        for p in omega
            if p[i] == i
                push!(event,p)
            end
        end
        push!(matchEvents,event)
    end
    noMatch = setdiff(omega,union(matchEvents...))
    return length(noMatch) / length(omega)
end

formulaCalcAllMiss(n) = sum([(-1)^k / factorial(k) for k in 0:n])

function mcAllMiss(n, N)
    function envelopeStuffer()
        envelopes = Random.shuffle!(collect(1:n))
        return sum([envelopes[i] == i for i in 1:n]) == 0
    end
    data = [envelopeStuffer() for _ in 1:N]
    return sum(data) / N
end

function main_secretary_envelopes()
    N = 10^6
    println("n\tBrute Force\tFormula\t\tMonte Carlo\tAsymptotic",)
    for n in 1:6
        bruteForce = bruteSetsProbabilityAllMiss(n)
        fromFormula = formulaCalcAllMiss(n)
        fromMC = mcAllMiss(n,N)
        println(n,"\t",round(bruteForce,digits = 4),"\t\t",round(fromFormula,digits = 4),    "\t\t",round(fromMC,digits = 4),"\t\t",round(1 / MathConstants.e,digits = 4))
    end
end

if abspath(PROGRAM_FILE) == @__FILE__
    main_secretary_envelopes()
end

export bruteSetsProbabilityAllMiss
export mcAllMiss
export envelopeStuffer
export main_secretary_envelopes
