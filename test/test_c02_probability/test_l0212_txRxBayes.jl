
using Test

@testset "Bayes Rule Tests" begin
  result = bayes_rule(0.7, 0.1, 0.05)
  result = round(result,digits=2)
  @test result==0.96
end
