using Test


using c05_inference: prior1_triangle
using c05_inference: like1_poisson
using c05_inference: posteriorUpToK1
using c05_inference: compute_K1
using c05_inference: posterior1
using c05_inference: compute_bayesEstimate1


@testset "prior1_triangle" begin
 result = prior1_triangle(2)
 result = round(result,digits = 2)
 @test result == 0.13
end
@testset "like1_poisson" begin
result = like1_poisson(10)
 result = round(result,digits = 4)
 @test result == 0.0
end
@testset "posteriorUpToK1" begin
result = posteriorUpToK1(3)
 result = round(result,digits = 4)
 @test result == 0.0
end
@testset "compute_K1" begin
result = compute_K1()
  result = round(result,digits = 4)
  @test result == 0.0
end
@testset "posterior1" begin
result = posterior1(5)
 result = round(result,digits = 4)
 @test result == 0.0
end
@testset "compute_bayesEstimate1" begin
result = compute_bayesEstimate1()
  result = round(result,digits = 2)
  @test result == 1.94
end

@testset "end_to_end" begin
    bayesEstimate = compute_bayesEstimate1()
    bayesEstimate = round(bayesEstimate,digits = 2)
    @test bayesEstimate == 1.94
    plot(lamRange, prior.(lamRange),     c = :blue, label = "Prior distribution")
    plot!(lamRange, posterior.(lamRange),    c = :red, label = "Posterior distribution",    xlims = (0, 10), ylims = (0, 1.2),    xlabel = L"\lambda",ylabel = "Density")
end