using Test
using c05_inference: prior2_gamma
using c05_inference: like2_poisson
using c05_inference: posteriorUpToK2
using c05_inference: compute_K
using c05_inference: posterior2
using c05_inference: compute_bayesEstimate
using c05_inference: compute_closedFormBayesEstimate

@testset "end_to_end" begin
bayesEstimate = compute_bayesEstimate()
bayesEstimate = round(bayesEstimate,digits = 2)
@test bayesEstimate == 2.06

closedFormBayesEstimate = compute_closedFormBayesEstimate()
closedFormBayesEstimate = round(closedFormBayesEstimate,digits = 2)
@test closedFormBayesEstimate == 2.06

delta = 10^-4.0
lamRange = 0:delta:10

plot(lamRange, prior2_gamma.(lamRange),    c = :blue, label = "Prior distribution")
plot!(lamRange, posterior2.(lamRange),    c = :red, label = "Posterior distribution",    xlims = (0, 10), ylims = (0, 1.2),        xlabel = L"\lambda",ylabel = "Density")
end
