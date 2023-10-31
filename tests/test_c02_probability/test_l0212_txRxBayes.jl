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

using Test

@testset "Bayes Rule Tests" begin
  result = bayes_rule(0.7, 0.1, 0.05)
  result = round(result,digits=2)
  @test result==0.96
end
