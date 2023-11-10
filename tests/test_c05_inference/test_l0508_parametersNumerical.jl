using Random, Distributions, NLsolve
Random.seed!(0)
a, b, c = 3, 5, 4
n = 2000

m_k(k, data) = 1 / n*sum(data.^k)
sim_mHats(samples) = [m_k(i,samples) for i in 1:3]
function generate_data()
    dist = TriangularDist(a,b,c)
    samples = rand(dist,n)
    return samples
end

samples = generate_data()
mHats = sim_mHats(samples)

function equations(F, x)
    F[1] = 1 / 3 * ( x[1] + x[2] + x[3] ) - mHats[1]
    F[2] = 1 / 6 * ( x[1]^2 + x[2]^2 + x[3]^2 + x[1] * x[2] + x[1] * x[3] + x[2] * x[3] ) - mHats[2]
    F[3] = 1 / 10 * ( x[1]^3 + x[2]^3 + x[3]^3 + x[1]^2 * x[2] + x[1]^2 * x[3] + x[2]^2 * x[1] + x[2]^2 * x[3] + x[3]^2 * x[1] + x[3]^2 * x[2] + x[1] * x[2] * x[3] ) - mHats[3]
end

@testset "end_to_end" begin

nlOutput = nlsolve(equations, [ 0.1; 0.1; 0.1])
sol = sort(nlOutput.zero)
aHat, bHat, cHat = sol[1], sol[3], sol[2]
@test round(aHat,digits = 2) == 2.99
@test round(bHat,digits = 2) == 5.02
@test round(cHat,digits = 2) == 3.94

end