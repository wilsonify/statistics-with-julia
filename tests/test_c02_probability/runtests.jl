using Test
using SafeTestsets


@time @safetestset "smoke Test" begin
    @test true
  end

  @time @safetestset "l0201_diceSumEven.jl Tests" begin
      path_to_here = @__DIR__
      include("$path_to_here/test_l0201_diceSumEven.jl")
  end
  @time @safetestset "l0202_passwords.jl Tests" begin
      path_to_here = @__DIR__
      include("$path_to_here/test_l0202_passwords.jl")
  end
  @time @safetestset "l0203_birthdayProblem.jl Tests" begin
      path_to_here = @__DIR__
      include("$path_to_here/test_l0203_birthdayProblem.jl")
  end
  @time @safetestset "l0204_fishing.jl Tests" begin
      path_to_here = @__DIR__
      include("$path_to_here/test_l0204_fishing.jl")
  end
  @time @safetestset "l0205_catalan.jl Tests" begin
      path_to_here = @__DIR__
      include("$path_to_here/test_l0205_catalan.jl")
  end
  @time @safetestset "l0206_sets.jl Tests" begin
      path_to_here = @__DIR__
      include("$path_to_here/test_l0206_sets.jl")
  end
  @time @safetestset "l0207_mcFalacy.jl Tests" begin
      path_to_here = @__DIR__
      include("$path_to_here/test_l0207_mcFalacy.jl")
  end
  @time @safetestset "l0208_secretaryEnvelopes.jl Tests" begin
      path_to_here = @__DIR__
      include("$path_to_here/test_l0208_secretaryEnvelopes.jl")
  end
  @time @safetestset "l0209_occupancyProblem.jl Tests" begin
      path_to_here = @__DIR__
      include("$path_to_here/test_l0209_occupancyProblem.jl")
  end
  @time @safetestset "l0210_independence.jl Tests" begin
      path_to_here = @__DIR__
      include("$path_to_here/test_l0210_independence.jl")
  end
  @time @safetestset "l0211_conditionalProbability.jl Tests" begin
      path_to_here = @__DIR__
      include("$path_to_here/test_l0211_conditionalProbability.jl")
  end

  @time @safetestset "l0212_txRxBayes.jl Tests" begin
      path_to_here = @__DIR__
      include("$path_to_here/test_l0212_txRxBayes.jl")
  end
  @time @safetestset "l0213_montyHall.jl Tests" begin
      path_to_here = @__DIR__
      include("$path_to_here/test_l0213_montyHall.jl")
  end
