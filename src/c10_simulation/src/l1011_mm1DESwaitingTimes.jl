#=
Discrete event simulation for M/M/1 waiting times
=#
using DataStructures, Distributions, StatsBase, PyPlot, Random

function simMM1Wait(lambda, mu, T)
    tNextArr = rand(Exponential(1 / lambda))
    tNextDep = Inf
    t = tNextArr

    waitingRoom = Deque{Float64}()  # Use Deque with Float64 type
    serverBusy = false
    waitTimes = Float64[]

    while t < T
        if t == tNextArr
            if !serverBusy
                tNextDep = t + rand(Exponential(1 / mu))
                serverBusy = true
                push!(waitTimes, 0.0)
            else
                push!(waitingRoom, t)
            end
            tNextArr = t + rand(Exponential(1 / lambda))
        else
            if isempty(waitingRoom)
                tNextDep = Inf
                serverBusy = false
            else
                tArr = popfirst!(waitingRoom)
                waitTime = t - tArr
                push!(waitTimes, waitTime)
                tNextDep = t + rand(Exponential(1 / mu))
            end
        end
        t = min(tNextArr, tNextDep)
    end

    return waitTimes
end

Random.seed!(1)
lambda, mu = 0.8, 1.0
T = 10^3

data = simMM1Wait(lambda, mu, T)
empiricalCDF = ecdf(data)

F(x) = 1 - (lambda / mu) * MathConstants.e^(- (mu - lambda) * x)
xGrid = 0:0.1:20

plot(xGrid, F.(xGrid), "b", label = "Analytic CDF of waiting time")
plot(xGrid, empiricalCDF(xGrid), "r", label = "ECDF of waiting times")
xlabel("x")
xlim(0, 20)
ylim(0, 1)
legend(loc = "lower right")
