using Test
using SafeTestsets

@time @safetestset "smoke Test" begin     @test true end

@time @safetestset "test_l1001_predatorPrey.jl" begin
 path_to_here = @__DIR__
  include("$path_to_here/test_l1001_predatorPrey.jl")
  end
@time @safetestset "test_l1002_springMass.jl" begin
 path_to_here = @__DIR__
  include("$path_to_here/test_l1002_springMass.jl")
  end
@time @safetestset "test_l1003_seir.jl" begin
 path_to_here = @__DIR__
  include("$path_to_here/test_l1003_seir.jl")
  end
@time @safetestset "test_l1004_simpleMarkov.jl" begin
 path_to_here = @__DIR__
  include("$path_to_here/test_l1004_simpleMarkov.jl")
  end
@time @safetestset "test_l1005_mcTransientCalculation.jl" begin
 path_to_here = @__DIR__
  include("$path_to_here/test_l1005_mcTransientCalculation.jl")
  end
@time @safetestset "test_l1006_catMouse.jl" begin
 path_to_here = @__DIR__
  include("$path_to_here/test_l1006_catMouse.jl")
  end
@time @safetestset "test_l1007_qMatrixSimulation.jl" begin
 path_to_here = @__DIR__
  include("$path_to_here/test_l1007_qMatrixSimulation.jl")
  end
@time @safetestset "test_l1008_mm1Gillespie.jl" begin
 path_to_here = @__DIR__
  include("$path_to_here/test_l1008_mm1Gillespie.jl")
  end
@time @safetestset "test_l1009_SEIRStoch.jl" begin
 path_to_here = @__DIR__
  include("$path_to_here/test_l1009_SEIRStoch.jl")
  end
@time @safetestset "test_l1010_DESqueue.jl" begin
 path_to_here = @__DIR__
  include("$path_to_here/test_l1010_DESqueue.jl")
  end
@time @safetestset "test_l1011_mm1DESwaitingTimes.jl" begin
 path_to_here = @__DIR__
  include("$path_to_here/test_l1011_mm1DESwaitingTimes.jl")
  end
@time @safetestset "test_l1012_predatorPreyStoch.jl" begin
 path_to_here = @__DIR__
  include("$path_to_here/test_l1012_predatorPreyStoch.jl")
  end
@time @safetestset "test_l1013_kalman.jl" begin
 path_to_here = @__DIR__
  include("$path_to_here/test_l1013_kalman.jl")
  end
@time @safetestset "test_l1013_temperatureNoise.jl" begin
 path_to_here = @__DIR__
  include("$path_to_here/test_l1013_temperatureNoise.jl")
  end
@time @safetestset "test_l1014_reliability.jl" begin
 path_to_here = @__DIR__
  include("$path_to_here/test_l1014_reliability.jl")
  end
@time @safetestset "test_l1015_networkLifeTime.jl" begin
 path_to_here = @__DIR__
  include("$path_to_here/test_l1015_networkLifeTime.jl")
  end
@time @safetestset "test_l1016_basicCRN.jl" begin
 path_to_here = @__DIR__
  include("$path_to_here/test_l1016_basicCRN.jl")
  end
@time @safetestset "test_l1017_twoRNGs.jl" begin
 path_to_here = @__DIR__
  include("$path_to_here/test_l1017_twoRNGs.jl")
  end