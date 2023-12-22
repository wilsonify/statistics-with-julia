module StatisticsWithJulia
    include("t01_testing/t01_are_dataframes_equal.jl")
    include("t01_testing/t02_are_lists_equal.jl")
    include("t01_testing/t03_text_to_dataframe.jl")
    include("t01_testing/t04_dataframe_to_dict.jl")
    include("t01_testing/t05_are_arrays_equal.jl")
    include("c01_CallC/l0121_usingC.jl")
    include("c01_intro/l0101_helloWorld.jl")
    include("c01_intro/l0102_comprehension.jl")
    include("c01_intro/l0103_slow.jl")
    include("c01_intro/l0104_fast.jl")
    include("c01_intro/l0105_scope.jl")
    include("c01_intro/l0106_bubbleSort.jl")
    include("c01_intro/l0107_polyRoots.jl")
    include("c01_intro/l0108_multiWayMarkovChainStationary.jl")
    include("c01_intro/l0110_plotSimple.jl")
    include("c01_intro/l0111_hailstoneHistogram.jl")
    include("c01_intro/l0112_graph.jl")
    include("c01_intro/l0113_imageProcessing.jl")
    include("c01_intro/l0114_seedExample.jl")
    include("c01_intro/l0115_piEstimate.jl")
    include("c01_intro/l0116_lcg.jl")
    include("c01_intro/l0117_randomWalks.jl")
    include("c02_probability/l0201_diceSumEven.jl")
    include("c02_probability/l0202_passwords.jl")
    include("c02_probability/l0203_birthdayProblem.jl")
    include("c02_probability/l0204_fishing.jl")
    include("c02_probability/l0205_catalan.jl")
    include("c02_probability/l0206_sets.jl")
    include("c02_probability/l0207_mcFalacy.jl")
    include("c02_probability/l0208_secretaryEnvelopes.jl")
    include("c02_probability/l0209_occupancyProblem.jl")
    include("c02_probability/l0210_independence.jl")
    include("c02_probability/l0211_conditionalProbability.jl")
    include("c02_probability/l0212_txRxBayes.jl")
    include("c02_probability/l0213_montyHall.jl")
    include("c03_distribution/l0301_randomVariable.jl")
    export randomName
    export main_l0301_randomVariable
    include("c03_distribution/l0302_discreteContinuous.jl")
    export pContinuous
    export pContinuous2
    include("c03_distribution/l0303_meanIntegration.jl")
    export expect
    include("c03_distribution/l0304_varianceTransformation.jl")
    export variance_transform
    include("c03_distribution/l0305_cdfFromPdf.jl")
    export approximate_CDF
    include("c03_distribution/l0306_inverseCDF.jl")
    export infimum
    export invCDF
    include("c03_distribution/l0307_mgf.jl")
    export mgf
    export mgfPointEst
    include("c03_distribution/l0308_weightVector.jl")
    export count_occurance
    include("c03_distribution/l0309_triangularDist.jl")
    export TriangularPDF
    export TriangularCDF
    export TriangularInvCDF
    include("c03_distribution/l0310_distributionDescriptors.jl")
    export getDescriptors
    include("c03_distribution/l0311_basicDistRand.jl")
    export main_l0311_basicDistRand
    include("c03_distribution/l0312_triangularDistInv.jl")
    export main_l0312_triangularDistInv
    include("c03_distribution/l0313_discreteDists.jl")
    export summarizeDistributions
    include("c03_distribution/l0314_uniformDiscreteDice.jl")
    export simulate_die_tosses
    export count_dice_roll_outcomes
    include("c03_distribution/l0315_binomialCoinFlip.jl")
    export binomialRV
    include("c03_distribution/l0316_geometric.jl")
    export rouletteSpins
    include("c03_distribution/l0317_negativeBinomial.jl")
    export rouletteSpins
    include("c03_distribution/l0318_hypergeometric.jl")
    export main_l0318_hypergeometric
    include("c03_distribution/l0319_poisson.jl")
    export prn
    include("c03_distribution/l0320_continuousDists.jl")
    export summarize_dist
    export range_of_dist
    include("c03_distribution/l0321_continuousUniform.jl")
    export main_l0321_continuousUniform
    include("c03_distribution/l0322_expGeom.jl")
    export generate_exp_data
    export process_exp_data
    export get_proportions
    export generate_matching_geom_data
    include("c03_distribution/l0323_gammaDist.jl")
    export normalizedData
    export main_l0323_gammaDist
    include("c03_distribution/l0324_betaDist.jl")
    export main_l0324_betaDist
    include("c03_distribution/l0325_gammafunctionIntegration.jl")
    export g
    export main_l0325_gammafunctionIntegration
    include("c03_distribution/l0326_weibullHazard.jl")
    export lambda
    export theta
    export hA
    export hB
    export main_l0326_weibullHazard
    include("c03_distribution/l0327_normalCalculus.jl")
    export PhiA
    export PhiB
    export normalDensity
    export main_l0327_normalCalculus
    include("c03_distribution/l0328_rayleigh.jl")
    export generate_rayleigh_data1
    export generate_rayleigh_data2
    export generate_rayleigh_data3
    export main_l0328_rayleigh
    include("c03_distribution/l0329_normalDistribution.jl")
    export Z
    export main_l0329_normalDistribution
    include("c03_distribution/l0330_cauchyCMA.jl")
    export generate_cauchy_data
    export running_proportion
    export main_l0330_cauchyCMA
    include("c03_distribution/l0331_jointPDF.jl")
    export twoD_Riemann_sum_over_density
    export twoD_Riemann_sum_to_evaluate_probability
    export main_l0331_jointPDF
    include("c03_distribution/l0332_multiRVgeneration.jl")
    export generate_random_vectors_with_desired_mean_and_covariance
    export stats
    export main_l0332_multiRVgeneration
#     include("c03_distribution/l0333_multiDimensionalIntegration.jl")
#     export main_l0333_multiDimensionalIntegration
#     include("c03_distribution/l0334_bivariateNormal.jl")
#     export main_l0334_bivariateNormal
    include("c04_data/l0401_callByValueByReference.jl")
    export f_mutable
    export f_immutable
    include("c04_data/l0402_shallowDeepCopy.jl")
    export immutable_behavior
    export no_copy_behavior
    export shallow_copy_outer_behavior
    export shallow_copy_inner_behavior
    export deep_copy_behavior

#     include("c04_data/l0403_dataframeInspection.jl")
#     include("c04_data/l0404_dataframeReferencing.jl")
#     include("c04_data/l0405_dataframeEditing.jl")
#     include("c04_data/l0406_dataframeCopyDeepCopy.jl")
#     include("c04_data/l0407_dataframeMissing.jl")
#     include("c04_data/l0408_dataframeReshape.jl")
#     include("c04_data/l0409_dataframeOperations.jl")
#     include("c04_data/l0410_dataframeImputation.jl")
#     include("c04_data/l0411_summarizingData.jl")
#     include("c04_data/l0412_meanVectCovMatrixSummary.jl")
#     include("c04_data/l0413_sampleCovarianceMatrix.jl")
#     include("c04_data/l0414_manualHistogram.jl")
#     include("c04_data/l0415_statsPlotsDensity.jl")
#     include("c04_data/l0416_KDE.jl")
#     include("c04_data/l0417_ecdf.jl")
#     include("c04_data/l0418_normalProbabilityPlot.jl")
#     include("c04_data/l0419_multipleSimplePlot.jl")
#     include("c04_data/l0420_radialPlot.jl")
#     include("c04_data/l0421_qqPlot.jl")
#     include("c04_data/l0422_boxplot.jl")
#     include("c04_data/l0423_violinPlot.jl")
#     include("c04_data/l0424_scatterplot.jl")
#     include("c04_data/l0424_scatterplotMatrix.jl")
#     include("c04_data/l0425_marginalHists.jl")
#     include("c04_data/l0426_andrewsPlot.jl")
#     include("c04_data/l0427_pieChart.jl")
#     include("c04_data/l0428_barPlots.jl")
#     include("c04_data/l0429_stackplot.jl")
#     include("c04_data/l0430_lineSearch.jl")
#     include("c04_data/l0431_directorySearch.jl")
#
#     include("c04_postgresConnector/l0432_remoteDataServer.jl")
#     include("c05_inference/l0501_statisticsOfARandomSample.jl")
#     include("c05_inference/l0502_friendOfANormalDistribution.jl")
#     include("c05_inference/l0503_meanVarIndependence.jl")
#     include("c05_inference/l0504_tDistribution.jl")
#     include("c05_inference/l0505_fDistribution.jl")
#     include("c05_inference/l0506_centralLimitTheorem.jl")
#     include("c05_inference/l0507_stdVarBiasEstimate.jl")
#     include("c05_inference/l0508_parametersNumerical.jl")
#     include("c05_inference/l0509_gammaLikelihood.jl")
#     include("c05_inference/l0510_mleGamma.jl")
#     include("c05_inference/l0511_mm_vs_mle.jl")
#     include("c05_inference/l0512_confidenceIntervalConcept.jl")
#     include("c05_inference/l0513_ciCoverage.jl")
#     include("c05_inference/l0514_teststatPvalRejectregion.jl")
#     include("c05_inference/l0515_simpleHypothesisTest.jl")
#     include("c05_inference/l0516_receiverOperatingCurve.jl")
#     include("c05_inference/l0517_randomizationTest.jl")
#     include("c05_inference/l0518_bayesUnivariate.jl")
#     include("c05_inference/l0519_bayesUnivariateConjugate.jl")
#     include("c05_inference/l0520_bayesMCMC.jl")
#
#     include("c06_confidence/l0601_onePopVKnown.jl")
#     include("c06_confidence/l0602_onePopVUnknown.jl")
#     include("c06_confidence/l0603_twoPopVKnown.jl")
#     include("c06_confidence/l0604_twoPopMVUnknownAEqual.jl")
#     include("c06_confidence/l0605_twoPopMVUnknownAUnequal.jl")
#     include("c06_confidence/l0606_vDOF_comparison.jl")
#     include("c06_confidence/l0607_proportionCI.jl")
#     include("c06_confidence/l0608_proportionCIsampleSize.jl")
#     include("c06_confidence/l0609_propCIcoverageAccuracy.jl")
#     include("c06_confidence/l0610_varianceCI.jl")
#     include("c06_confidence/l0611_sampleVarDists.jl")
#     include("c06_confidence/l0612_varianceCIalphas.jl")
#     include("c06_confidence/l0613_bCI.jl")
#     include("c06_confidence/l0614_bootstrapCI.jl")
#     include("c06_confidence/l0615_predictionInterval.jl")
#     include("c06_confidence/l0616_credible.jl")
#
#     include("c06_confidence/testcases_z.jl")
#     include("c07_hypothesis/l0701_infMeanSingleVarKnown.jl")
#     include("c07_hypothesis/l0702_infMeanSingleVarUnknown.jl")
#     include("c07_hypothesis/l0703_signTest.jl")
#     include("c07_hypothesis/l0704_TvsSign.jl")
#     include("c07_hypothesis/l0705_infMeanDiffVarKnown.jl")
#     include("c07_hypothesis/l0706_infMeanDiffVarAssumedEqual.jl")
#     include("c07_hypothesis/l0707_infMeanDiffVarAssumedUnequal.jl")
#     include("c07_hypothesis/l0708_dataBoxPlot.jl")
#     include("c07_hypothesis/l0708_sampleMeansANOVA.jl")
#     include("c07_hypothesis/l0709_ssDecomposition.jl")
#     include("c07_hypothesis/l0710_anovaFTest.jl")
#     include("c07_hypothesis/l0711_anovaFDistribution.jl")
#     include("c07_hypothesis/l0712_chiSqTest.jl")
#     include("c07_hypothesis/l0713_chiSqIndependence.jl")
#     include("c07_hypothesis/l0714_ksStatistic.jl")
#     include("c07_hypothesis/l0715_ksBrownian.jl")
#     include("c07_hypothesis/l0716_wald_wolfowitz.jl")
#     include("c07_hypothesis/l0717_power.jl")
#     include("c07_hypothesis/l0718_powerCurves.jl")
#     include("c07_hypothesis/l0719_pValDist.jl")
#
#     include("c08_regression/l0801_polyInterpolate.jl")
#     include("c08_regression/l0802_bestFitLine.jl")
#     include("c08_regression/l0803_leastSqMethods.jl")
#     include("c08_regression/l0804_usingGLM.jl")
#     include("c08_regression/l0805_distRegEstimators.jl")
#     include("c08_regression/l0807_confPredBands.jl")
#     include("c08_regression/l0808_anscombeQuartet.jl")
#     include("c08_regression/l0810_multiLinReg.jl")
#     include("c08_regression/l0811_collinearity.jl")
#     include("c08_regression/l0812_nonlinearGLM.jl")
#     include("c08_regression/l0813_categoricalReg.jl")
#     include("c08_regression/l0813_multiLinear.jl")
#     include("c08_regression/l0814_categoricalRegInteraction.jl")
#     include("c08_regression/l0814_interaction.jl")
#     include("c08_regression/l0815_simpsonsParadox.jl")
#     include("c08_regression/l0816_backwardElimination.jl")
#     include("c08_regression/l0816_stepwiseRegression.jl")
#     include("c08_regression/l0817_lassoSelection.jl")
#     include("c08_regression/l0818_logisticRegression.jl")
#     include("c08_regression/l0819_linkFunctions.jl")
#     include("c08_regression/l0820_EDAts.jl")
#     include("c08_regression/l0821_linearForecast.jl")
#     include("c08_regression/l0822_correlogram.jl")
#     include("c08_regression/l0824_residualAnalysis.jl")
#     include("c08_regression/l086_simpLinRegHypTst.jl")
#
#     include("c09_machine_learning/l0901_pretrained.jl")
#     include("c09_machine_learning/l0902_handcrafted.jl")
#     include("c09_machine_learning/l0903_fluxADAM.jl")
#     include("c09_machine_learning/l0904_leastSqSGD.jl")
#     include("c09_machine_learning/l0905_simpleLinearClassifier.jl")
#     include("c09_machine_learning/l0906_logisticSoftMax.jl")
#     include("c09_machine_learning/l0907_simpleSVM.jl")
#     include("c09_machine_learning/l0908_simpleRandomForest.jl")
#     include("c09_machine_learning/l0909_CNN_mnist.jl")
#     include("c09_machine_learning/l0909_NN_mnist.jl")
#     include("c09_machine_learning/l0910_ridgeRegressionCross.jl")
#     include("c09_machine_learning/l0911_dropout.jl")
#     include("c09_machine_learning/l0912_kMeans.jl")
#     include("c09_machine_learning/l0912_kMeansManual.jl")
#     include("c09_machine_learning/l0914_hClustering.jl")
#     include("c09_machine_learning/l0915_pca.jl")
#     include("c09_machine_learning/l0916_pcaMNIST.jl")
#     include("c09_machine_learning/l0917_mdpValueIteration.jl")
#     include("c09_machine_learning/l0918_qLearning.jl")
#     include("c09_machine_learning/l0919_generative.jl")
#     include("c09_machine_learning/l0920_adversarial.jl")
#
#     include("c10_simulation/l1001_predatorPrey.jl")
#     include("c10_simulation/l1002_springMass.jl")
#     include("c10_simulation/l1003_seir.jl")
#     include("c10_simulation/l1004_simpleMarkov.jl")
#     include("c10_simulation/l1005_mcTransientCalculation.jl")
#     include("c10_simulation/l1006_catMouse.jl")
#     include("c10_simulation/l1007_qMatrixSimulation.jl")
#     include("c10_simulation/l1008_mm1Gillespie.jl")
#     include("c10_simulation/l1009_SEIRStoch.jl")
#     include("c10_simulation/l1010_DESqueue.jl")
#     include("c10_simulation/l1011_mm1DESwaitingTimes.jl")
#     include("c10_simulation/l1012_predatorPreyStoch.jl")
#     include("c10_simulation/l1013_kalman.jl")
#     include("c10_simulation/l1013_temperatureNoise.jl")
#     include("c10_simulation/l1014_reliability.jl")
#     include("c10_simulation/l1015_networkLifeTime.jl")
#     include("c10_simulation/l1016_basicCRN.jl")
#     include("c10_simulation/l1017_twoRNGs.jl")

#   include("c11_api/generated/src/apis/api_MathApi.jl")
#   include("c11_api/generated/src/apis/api_PetApi.jl")
#   include("c11_api/generated/src/apis/api_StoreApi.jl")
#   include("c11_api/generated/src/apis/api_UserApi.jl")
#   include("c11_api/generated/src/modelincludes.jl")
#   include("c11_api/generated/src/models/model_AccuracyInput.jl")
#   include("c11_api/generated/src/models/model_ApiResponse.jl")
#   include("c11_api/generated/src/models/model_BucketizeInput.jl")
#   include("c11_api/generated/src/models/model_BucketizeOutput.jl")
#   include("c11_api/generated/src/models/model_Category.jl")
#   include("c11_api/generated/src/models/model_CorrelationInput.jl")
#   include("c11_api/generated/src/models/model_CorrelationMatrixInput.jl")
#   include("c11_api/generated/src/models/model_CorrelationMatrixOutput.jl")
#   include("c11_api/generated/src/models/model_CorrelationOutput.jl")
#   include("c11_api/generated/src/models/model_CovarianceInput.jl")
#   include("c11_api/generated/src/models/model_CovarianceOutput.jl")
#   include("c11_api/generated/src/models/model_DataRangeInput.jl")
#   include("c11_api/generated/src/models/model_DataRangeOutput.jl")
#   include("c11_api/generated/src/models/model_DeMeanInput.jl")
#   include("c11_api/generated/src/models/model_DeMeanOutput.jl")
#   include("c11_api/generated/src/models/model_DifferenceQuotientInput.jl")
#   include("c11_api/generated/src/models/model_DifferenceQuotientOutput.jl")
#   include("c11_api/generated/src/models/model_DistanceInput.jl")
#   include("c11_api/generated/src/models/model_DistanceOutput.jl")
#   include("c11_api/generated/src/models/model_DotInput.jl")
#   include("c11_api/generated/src/models/model_DotOutput.jl")
#   include("c11_api/generated/src/models/model_EstimateGradientInput.jl")
#   include("c11_api/generated/src/models/model_EstimateGradientOutput.jl")
#   include("c11_api/generated/src/models/model_F1ScoreInput.jl")
#   include("c11_api/generated/src/models/model_GetColumnInput.jl")
#   include("c11_api/generated/src/models/model_GetColumnOutput.jl")
#   include("c11_api/generated/src/models/model_GetRowInput.jl")
#   include("c11_api/generated/src/models/model_GetRowOutput.jl")
#   include("c11_api/generated/src/models/model_InRandomOrderInput.jl")
#   include("c11_api/generated/src/models/model_InterquartileRangeInput.jl")
#   include("c11_api/generated/src/models/model_MagnitudeInput.jl")
#   include("c11_api/generated/src/models/model_MatrixAddInput.jl")
#   include("c11_api/generated/src/models/model_MaximizeBatchInput.jl")
#   include("c11_api/generated/src/models/model_MaximizeBatchOutput.jl")
#   include("c11_api/generated/src/models/model_MaximizeStochasticInput.jl")
#   include("c11_api/generated/src/models/model_MaximizeStochasticOutput.jl")
#   include("c11_api/generated/src/models/model_MeanInput.jl")
#   include("c11_api/generated/src/models/model_MedianInput.jl")
#   include("c11_api/generated/src/models/model_MinimizeBatchInput.jl")
#   include("c11_api/generated/src/models/model_MinimizeBatchOutput.jl")
#   include("c11_api/generated/src/models/model_MinimizeStochasticInput.jl")
#   include("c11_api/generated/src/models/model_MinimizeStochasticOutput.jl")
#   include("c11_api/generated/src/models/model_ModeInput.jl")
#   include("c11_api/generated/src/models/model_Order.jl")
#   include("c11_api/generated/src/models/model_PartialDifferenceQuotientInput.jl")
#   include("c11_api/generated/src/models/model_PartialDifferenceQuotientOutput.jl")
#   include("c11_api/generated/src/models/model_Pet.jl")
#   include("c11_api/generated/src/models/model_PrecisionInput.jl")
#   include("c11_api/generated/src/models/model_QuantileInput.jl")
#   include("c11_api/generated/src/models/model_RecallInput.jl")
#   include("c11_api/generated/src/models/model_ScalarMultiplyInput.jl")
#   include("c11_api/generated/src/models/model_ShapeInput.jl")
#   include("c11_api/generated/src/models/model_ShapeOutput.jl")
#   include("c11_api/generated/src/models/model_SplitDataInput.jl")
#   include("c11_api/generated/src/models/model_SplitDataOutput.jl")
#   include("c11_api/generated/src/models/model_SqrtInput.jl")
#   include("c11_api/generated/src/models/model_SqrtOutput.jl")
#   include("c11_api/generated/src/models/model_SquaredDistanceInput.jl")
#   include("c11_api/generated/src/models/model_StandardDeviationInput.jl")
#   include("c11_api/generated/src/models/model_StrengthInput.jl")
#   include("c11_api/generated/src/models/model_StrengthOutput.jl")
#   include("c11_api/generated/src/models/model_SumOfSquaresInput.jl")
#   include("c11_api/generated/src/models/model_Tag.jl")
#   include("c11_api/generated/src/models/model_TrainTestSplitInput.jl")
#   include("c11_api/generated/src/models/model_TrainTestSplitOutput.jl")
#   include("c11_api/generated/src/models/model_User.jl")
#   include("c11_api/generated/src/models/model_VarianceInput.jl")
#   include("c11_api/generated/src/models/model_VectorAddInput.jl")
#   include("c11_api/generated/src/models/model_VectorMeanInput.jl")
#   include("c11_api/generated/src/models/model_VectorSubtractInput.jl")
#   include("c11_api/generated/src/models/model_VectorSumInput.jl")
#   include("c11_api/generated/src/server.jl")
#   include("c11_api/generated/src/statisticsWithJuliaAPI.jl")
#
#   include("c12_toy_application/MyApp.jl")
#   include("c12_toy_application/app_precompile.jl")
#   include("c12_toy_application/custom_sysimage.jl")
#   include("c12_toy_application/generate_csv_precompile.jl")
#
#   include("c13_MyApp/build.jl")
#   include("c13_MyApp/precompile_app.jl")
#
#   include("c13_MyApp/src/MyApp.jl")
#   include("c14_MyLib/build/additional_precompile.jl")
#   include("c14_MyLib/build/build.jl")
#   include("c14_MyLib/build/generate_precompile.jl")
#   include("c14_MyLib/src/MyLib.jl")

end