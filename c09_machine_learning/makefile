all: clean project.toml l0901_pretrained l0902_handcrafted l0903_fluxADAM l0904_leastSqSGD l0905_simpleLinearClassifier l0906_logisticSoftMax l0907_simpleSVM l0908_simpleRandomForest l0909_CNN_mnist l0909_NN_mnist l0910_ridgeRegressionCross l0911_dropout l0912_kMeans l0912_kMeansManual l0914_hClustering l0915_pca l0916_pcaMNIST l0917_mdpValueIteration l0918_qLearning l0919_generative l0920_adversarial

clean:
	rm -f Project.toml
	rm -f Manifest.toml

project.toml:
	julia setup.jl

l0901_pretrained:
	julia --project=. l0901_pretrained.jl
l0902_handcrafted:
	julia --project=. l0902_handcrafted.jl
l0903_fluxADAM:
	julia --project=. l0903_fluxADAM.jl
l0904_leastSqSGD:
	julia --project=. l0904_leastSqSGD.jl
l0905_simpleLinearClassifier:
	julia --project=. l0905_simpleLinearClassifier.jl
l0906_logisticSoftMax:
	julia --project=. l0906_logisticSoftMax.jl
l0907_simpleSVM:
	julia --project=. l0907_simpleSVM.jl
l0908_simpleRandomForest:
	julia --project=. l0908_simpleRandomForest.jl
l0909_CNN_mnist:
	julia --project=. l0909_CNN_mnist.jl
l0909_NN_mnist:
	julia --project=. l0909_NN_mnist.jl
l0910_ridgeRegressionCross:
	julia --project=. l0910_ridgeRegressionCross.jl
l0911_dropout:
	julia --project=. l0911_dropout.jl
l0912_kMeans:
	julia --project=. l0912_kMeans.jl
l0912_kMeansManual:
	julia --project=. l0912_kMeansManual.jl
l0914_hClustering:
	julia --project=. l0914_hClustering.jl
l0915_pca:
	julia --project=. l0915_pca.jl
l0916_pcaMNIST:
	julia --project=. l0916_pcaMNIST.jl
l0917_mdpValueIteration:
	julia --project=. l0917_mdpValueIteration.jl
l0918_qLearning:
	julia --project=. l0918_qLearning.jl
l0919_generative:
	julia --project=. l0919_generative.jl
l0920_adversarial:
	julia --project=. l0920_adversarial.jl