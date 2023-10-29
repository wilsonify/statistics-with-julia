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
  @time @safetestset "l0102_comprehension.jl Tests" begin
    path_to_here = @__DIR__
    include("$path_to_here/test_l0102_comprehension.jl")
  end
  @time @safetestset "l0103_slow.jl Tests" begin
    path_to_here = @__DIR__
    include("$path_to_here/test_l0103_slow.jl")
  end
  @time @safetestset "l0104_fast.jl Tests" begin
    path_to_here = @__DIR__
    include("$path_to_here/test_l0104_fast.jl")
  end
  @time @safetestset "l0105_scope.jl Tests" begin
    path_to_here = @__DIR__
    include("$path_to_here/test_l0105_scope.jl")
  end
    @time @safetestset "l0106_bubbleSort.jl Tests" begin
    path_to_here = @__DIR__
    include("$path_to_here/test_l0106_bubbleSort.jl")
  end
    @time @safetestset "l0107_polyRoots.jl Tests" begin
    path_to_here = @__DIR__
    include("$path_to_here/test_l0107_polyRoots.jl")
  end
    @time @safetestset "l0108_multiWayMarkovChainStationary.jl Tests" begin
    path_to_here = @__DIR__
    include("$path_to_here/test_l0108_multiWayMarkovChainStationary.jl")
  end
    @time @safetestset "l0110_plotSimple.jl Tests" begin
    path_to_here = @__DIR__
    include("$path_to_here/test_l0110_plotSimple.jl")
  end
    @time @safetestset "l0111_hailstoneHistogram.jl Tests" begin
    path_to_here = @__DIR__
    include("$path_to_here/test_l0111_hailstoneHistogram.jl")
  end
    @time @safetestset "l0112_graph.jl Tests" begin
    path_to_here = @__DIR__
    include("$path_to_here/test_l0112_graph.jl")
  end
    @time @safetestset "l0113_imageProcessing.jl Tests" begin
    path_to_here = @__DIR__
    include("$path_to_here/test_l0113_imageProcessing.jl")
  end
    @time @safetestset "l0114_seedExample.jl Tests" begin
    path_to_here = @__DIR__
    include("$path_to_here/test_l0114_seedExample.jl")
  end
    @time @safetestset "l0115_piEstimate.jl Tests" begin
    path_to_here = @__DIR__
    include("$path_to_here/test_l0115_piEstimate.jl")
  end
    @time @safetestset "l0116_lcg.jl Tests" begin
    path_to_here = @__DIR__
    include("$path_to_here/test_l0116_lcg.jl")
  end
    @time @safetestset "l0117_randomWalks.jl Tests" begin
    path_to_here = @__DIR__
    include("$path_to_here/test_l0117_randomWalks.jl")
  end
    @time @safetestset "l0118_usingR.jl Tests" begin
    path_to_here = @__DIR__
    include("$path_to_here/test_l0118_usingR.jl")
  end
    @time @safetestset "l0120_sentiment.jl Tests" begin
    path_to_here = @__DIR__
    include("$path_to_here/test_l0120_sentiment.py")
  end
    @time @safetestset "l0120_usingPython.jl Tests" begin
    path_to_here = @__DIR__
    include("$path_to_here/test_l0120_usingPython.jl")
  end
    @time @safetestset "l0121_usingC.jl Tests" begin
    path_to_here = @__DIR__
    include("$path_to_here/test_l0121_usingC.jl")
  end

end