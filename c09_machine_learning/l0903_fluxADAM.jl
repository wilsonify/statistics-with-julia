using Flux, Random, LinearAlgebra, CSV, DataFrames
using Flux.Optimise: update!
Random.seed!(0)
path_to_here=@__DIR__
path_to_data=abspath("$path_to_here/../data")
data = CSV.read("$path_to_data/L1L2data.csv", DataFrame)
xVals, yVals = Array{Float64}(data.X), Array{Float64}(data.Y)
eta = 0.05
epsilon = 10^-7
b = rand(2)
predict(x) = b[1] .+ b[2] * x
loss(x, y) = sum((y .- predict(x)).^2)
opt = ADAM(eta)
iter, gradNorm = 0, 1.0
while gradNorm >= epsilon
    gs = gradient(()->loss(xVals,yVals),params(b))
    update!(opt,b,gs[b])
    gradNorm = norm(gs[b])
    global iter += 1
end
println("Number of iterations: ", iter)
println("Coefficients:", b)