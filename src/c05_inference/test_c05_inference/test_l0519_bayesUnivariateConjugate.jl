using Test
@testset "end_to_end" begin
bayesEstimate = compute_bayesEstimate()
bayesEstimate = round(bayesEstimate,digits = 2)
@test bayesEstimate == 2.06

closedFormBayesEstimate = compute_closedFormBayesEstimate()
closedFormBayesEstimate = round(closedFormBayesEstimate,digits = 2)
@test closedFormBayesEstimate == 2.06

plot(lamRange, prior.(lamRange),    c = :blue, label = "Prior distribution")
plot!(lamRange, posterior.(lamRange),    c = :red, label = "Posterior distribution",    xlims = (0, 10), ylims = (0, 1.2),        xlabel = L"\lambda",ylabel = "Density")
end
