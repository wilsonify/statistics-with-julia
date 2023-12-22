# Transmitted (Tx) and Received (Rx) Bayes
using Random

function flip_with_prob(bit, prob)
    return rand() < prob ? xor(bit, 1) : bit
end

function bayes_rule(prob1, eps0, eps1)
    return ((1 - eps1) * prob1) / ((1 - eps1) * prob1 + (1 - prob1) * eps0)
end

function simulate(N)
    numTx1 = 0
    totalRx1 = 0
    for i in 1:N
        if RxData[i] == 1
            totalRx1 += 1
            numTx1 += TxData[i]
        end
    end
    monteCarlo = numTx1 / totalRx1
    return monteCarlo
end

function calculate(N, prob1, eps0, eps1)
    TxData = rand(N) .< prob1
    RxData = [x == 0 ? flip_with_prob(x, eps0) : flip_with_prob(x, eps1) for x in TxData]
    return numTx1 / totalRx1
end

function main_txrxbayes()
    prob1 = 0.7
    eps0 = 0.1
    eps1 = 0.05
    analytic = bayes_rule(prob1, eps0, eps1)
    println("Analytic: $analytic")
    monte_carlo = simulation(prob1, eps0, eps1)
    println("Monte Carlo: $monte_carlo")
end

if abspath(PROGRAM_FILE) == @__FILE__
    main_txrxbayes()
end

export flip_with_prob
export bayes_rule
export simulate
export calculate
