#=
Using SGD for least squares
=#
using PyPlot, Random, Distributions

n = 10^3
beta0 = 2.0
beta1 = 1.5
sigma = 2.5

Random.seed!(1958)
xVals = rand(0:0.01:5, n)
yVals = beta0 .+ beta1 * xVals + rand(Normal(0, sigma), n)

pts = []
eta = 10^-3.
global beta_estimate = [0.0, 0.0]  # Initialize beta_estimate with zeros
push!(pts, beta_estimate)

for k in 1:10^4
    i = rand(1:n)
    g = [
        2 * (beta_estimate[1] + beta_estimate[2] * xVals[i] - yVals[i]),
        2 * xVals[i] * (beta_estimate[1] + beta_estimate[2] * xVals[i] - yVals[i])
    ]
    beta_estimate = beta_estimate - eta * g
    push!(pts, beta_estimate)
end

figure(figsize=(10,5))
subplot(121)
plot(first.(pts), last.(pts), "k", lw="0.5", label="SGD path")
plot(beta_estimate[1], beta_estimate[2], ".b", ms="10.0", label="SGD")
plot(beta0, beta1, ".r", ms="10.0", label="Actual")
xlim(0, 2.5)
ylim(0, 2.5)
legend(loc="upper left")
xlabel("Beta0")
ylabel("Beta1")

subplot(122)
plot(xVals, yVals, "k.", ms="1", label="Data points")
plot([0, 5], [beta_estimate[1], beta_estimate[1] + 5 * beta_estimate[2]], "b", label="SGD")
plot([0, 5], [beta0, beta0 + 5 * beta1], "r", label="Actual")
xlim(0, 5)
ylim(-5, 15)
legend(loc="upper left")
