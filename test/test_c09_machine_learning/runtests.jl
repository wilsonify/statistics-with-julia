using Test
using SafeTestsets

@time  @safetestset "smoke Test" begin     @test true end

@time  @safetestset "test_l0901_pretrained.jl" begin
  path_to_here = @__DIR__
   include("$path_to_here/test_l0901_pretrained.jl")
   end
@time  @safetestset "test_l0902_handcrafted.jl" begin
  path_to_here = @__DIR__
   include("$path_to_here/test_l0902_handcrafted.jl")
   end
@time  @safetestset "test_l0903_fluxADAM.jl" begin
  path_to_here = @__DIR__
   include("$path_to_here/test_l0903_fluxADAM.jl")
   end
@time  @safetestset "test_l0904_leastSqSGD.jl" begin
  path_to_here = @__DIR__
   include("$path_to_here/test_l0904_leastSqSGD.jl")
   end
@time  @safetestset "test_l0905_simpleLinearClassifier.jl" begin
  path_to_here = @__DIR__
   include("$path_to_here/test_l0905_simpleLinearClassifier.jl")
   end
@time  @safetestset "test_l0906_logisticSoftMax.jl" begin
  path_to_here = @__DIR__
   include("$path_to_here/test_l0906_logisticSoftMax.jl")
   end
@time  @safetestset "test_l0907_simpleSVM.jl" begin
  path_to_here = @__DIR__
   include("$path_to_here/test_l0907_simpleSVM.jl")
   end
@time  @safetestset "test_l0908_simpleRandomForest.jl" begin
  path_to_here = @__DIR__
   include("$path_to_here/test_l0908_simpleRandomForest.jl")
   end
@time  @safetestset "test_l0909_CNN_mnist.jl" begin
  path_to_here = @__DIR__
   include("$path_to_here/test_l0909_CNN_mnist.jl")
   end
@time  @safetestset "test_l0909_NN_mnist.jl" begin
  path_to_here = @__DIR__
   include("$path_to_here/test_l0909_NN_mnist.jl")
   end
@time  @safetestset "test_l0910_ridgeRegressionCross.jl" begin
  path_to_here = @__DIR__
   include("$path_to_here/test_l0910_ridgeRegressionCross.jl")
   end
@time  @safetestset "test_l0911_dropout.jl" begin
  path_to_here = @__DIR__
   include("$path_to_here/test_l0911_dropout.jl")
   end
@time  @safetestset "test_l0912_kMeans.jl" begin
  path_to_here = @__DIR__
   include("$path_to_here/test_l0912_kMeans.jl")
   end
@time  @safetestset "test_l0912_kMeansManual.jl" begin
  path_to_here = @__DIR__
   include("$path_to_here/test_l0912_kMeansManual.jl")
   end
@time  @safetestset "test_l0914_hClustering.jl" begin
  path_to_here = @__DIR__
   include("$path_to_here/test_l0914_hClustering.jl")
   end
@time  @safetestset "test_l0915_pca.jl" begin
  path_to_here = @__DIR__
   include("$path_to_here/test_l0915_pca.jl")
   end
@time  @safetestset "test_l0916_pcaMNIST.jl" begin
  path_to_here = @__DIR__
   include("$path_to_here/test_l0916_pcaMNIST.jl")
   end
@time  @safetestset "test_l0917_mdpValueIteration.jl" begin
  path_to_here = @__DIR__
   include("$path_to_here/test_l0917_mdpValueIteration.jl")
   end
@time  @safetestset "test_l0918_qLearning.jl" begin
  path_to_here = @__DIR__
   include("$path_to_here/test_l0918_qLearning.jl")
   end
@time  @safetestset "test_l0919_generative.jl" begin
  path_to_here = @__DIR__
   include("$path_to_here/test_l0919_generative.jl")
   end
@time  @safetestset "test_l0920_adversarial.jl" begin
  path_to_here = @__DIR__
   include("$path_to_here/test_l0920_adversarial.jl")
   end