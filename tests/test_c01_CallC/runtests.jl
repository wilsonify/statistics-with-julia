using Test
using SafeTestsets

@time @safetestset "test_c01_CallC" begin
    @time @safetestset "smoke Test" begin
      @test true
    end
  @time @safetestset "l0121_usingC.jl Tests" begin
    path_to_here = @__DIR__
    include("$path_to_here/test_l0121_usingC.jl")
  end
end