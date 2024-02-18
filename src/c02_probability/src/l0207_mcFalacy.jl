# An innocent mistake with Monte Carlo
using Random, StatsBase

function mc_estimate1(N, omega, A, B)
     return sum([in(sample(omega),A) || in(sample(omega),B) for _ in 1:N]) / N
end

function mc_estimate2(N, omega, A, B)
     return sum([in(sample(omega),union(A,B)) for _ in 1:N]) / N
end

function run_simulations_falacy(nsims)
    N = 1000
    A = Set(['a', 'e', 'i', 'o', 'u'])
    B = Set(['x', 'y', 'z'])
    omega = 'a':'z'
    for _ in 1:nsims
        mcEst1 = mc_estimate1(N,omega,A,B)
        mcEst2 = mc_estimate2(N,omega,A,B)
        println(mcEst1,"\t",mcEst2)
    end

end


if abspath(PROGRAM_FILE) == @__FILE__
    run_simulations_falacy()
end


export mc_estimate1
export mc_estimate2
export run_simulations_falacy
