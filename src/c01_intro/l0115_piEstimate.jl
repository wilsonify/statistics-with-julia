# Estimating π
using Random, LinearAlgebra, Plots; gr()
Random.seed!()

function estimate_pi(N)
    data = [[rand(), rand()] for _ in 1:N]
    indata = filter((x) -> (norm(x) <= 1), data)
    outdata = filter((x) -> (norm(x) > 1), data)
    piApprox = 4 * length(indata) / N
    return piApprox, indata, outdata
end

function main_pi_estimate()
    N = 10^5
    piApprox, indata, outdata = estimate_pi(N)
    println("Pi Estimate: ", piApprox)
    scatter(first.(indata), last.(indata), c = :blue, ms = 1, msw = 0)
    scatter!(first.(outdata), last.(outdata), c = :red, ms = 1, msw = 0, xlims = (0, 1), ylims = (0, 1), legend = :none, ratio = :equal)
end

if abspath(PROGRAM_FILE) == @__FILE__
    main_pi_estimate()
end

export estimate_pi