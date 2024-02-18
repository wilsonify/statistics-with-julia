using Test
@testset "prior" begin
 result = prior(2)
 result = round(result,digits = 2)
 @test result == 0.13
end
@testset "like" begin
result = like(10)
 result = round(result,digits = 4)
 @test result == 0.0
end
@testset "posteriorUpToK" begin
result = posteriorUpToK(3)
 result = round(result,digits = 4)
 @test result == 0.0
end
@testset "compute_K" begin
result = compute_K()
  result = round(result,digits = 4)
  @test result == 0.0
end
@testset "posterior" begin
result = posterior(5)
 result = round(result,digits = 4)
 @test result == 0.0
end
@testset "compute_bayesEstimate" begin
result = compute_bayesEstimate()
  result = round(result,digits = 2)
  @test result == 1.94
end

@testset "end_to_end" begin
    bayesEstimate = compute_bayesEstimate()
    bayesEstimate = round(bayesEstimate,digits = 2)
    @test bayesEstimate == 1.94
    plot(lamRange, prior.(lamRange),     c = :blue, label = "Prior distribution")
    plot!(lamRange, posterior.(lamRange),    c = :red, label = "Posterior distribution",    xlims = (0, 10), ylims = (0, 1.2),    xlabel = L"\lambda",ylabel = "Density")
end