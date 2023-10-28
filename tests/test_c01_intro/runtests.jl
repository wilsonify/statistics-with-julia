using Test
using SafeTestsets

@time @safetestset "c01_intro" begin
    @time @safetestset "smoke Test" begin
      @test true
    end
  @time @safetestset "l0101_helloWorld.jl Tests" begin
    path_to_here = @__DIR__
    include("$path_to_here/test_l0101_helloWorld.jl")
  end
  @time @safetestset "l0101_helloWorld.jl Tests" begin
    path_to_here = @__DIR__
    include("$path_to_here/test_l0102_comprehension.jl")
  end
end