using Test
using SafeTestsets

@time @safetestset "test_c01_CallR" begin
    @time @safetestset "smoke Test" begin
      @test true
    end
    @time @safetestset "l0118_usingR.jl Tests" begin
      path_to_here = @__DIR__
      include("$path_to_here/test_l0118_usingR.jl")
  end
end