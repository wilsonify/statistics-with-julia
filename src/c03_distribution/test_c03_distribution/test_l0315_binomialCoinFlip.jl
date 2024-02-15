using StatisticsWithJulia: binomialRV
using StatsBase
using Distributions
using Test
@testset "end_to_end" begin
p, n, N = 0.5, 10, 10^6
bDist = Binomial(n,p)
xGrid = 0:n
bPmf = [pdf(bDist,i) for i in xGrid]
data = [binomialRV(n,p) for _ in 1:N]
pmfEst = counts(data,0:n) / N
end