
module c11_api
  include("c11_api/generated/src/apis/api_MathApi.jl")
  include("c11_api/generated/src/apis/api_PetApi.jl")
  include("c11_api/generated/src/apis/api_StoreApi.jl")
  include("c11_api/generated/src/apis/api_UserApi.jl")
  include("c11_api/generated/src/modelincludes.jl")
  include("c11_api/generated/src/models/model_AccuracyInput.jl")
  include("c11_api/generated/src/models/model_ApiResponse.jl")
  include("c11_api/generated/src/models/model_BucketizeInput.jl")
  include("c11_api/generated/src/models/model_BucketizeOutput.jl")
  include("c11_api/generated/src/models/model_Category.jl")
  include("c11_api/generated/src/models/model_CorrelationInput.jl")
  include("c11_api/generated/src/models/model_CorrelationMatrixInput.jl")
  include("c11_api/generated/src/models/model_CorrelationMatrixOutput.jl")
  include("c11_api/generated/src/models/model_CorrelationOutput.jl")
  include("c11_api/generated/src/models/model_CovarianceInput.jl")
  include("c11_api/generated/src/models/model_CovarianceOutput.jl")
  include("c11_api/generated/src/models/model_DataRangeInput.jl")
  include("c11_api/generated/src/models/model_DataRangeOutput.jl")
  include("c11_api/generated/src/models/model_DeMeanInput.jl")
  include("c11_api/generated/src/models/model_DeMeanOutput.jl")
  include("c11_api/generated/src/models/model_DifferenceQuotientInput.jl")
  include("c11_api/generated/src/models/model_DifferenceQuotientOutput.jl")
  include("c11_api/generated/src/models/model_DistanceInput.jl")
  include("c11_api/generated/src/models/model_DistanceOutput.jl")
  include("c11_api/generated/src/models/model_DotInput.jl")
  include("c11_api/generated/src/models/model_DotOutput.jl")
  include("c11_api/generated/src/models/model_EstimateGradientInput.jl")
  include("c11_api/generated/src/models/model_EstimateGradientOutput.jl")
  include("c11_api/generated/src/models/model_F1ScoreInput.jl")
  include("c11_api/generated/src/models/model_GetColumnInput.jl")
  include("c11_api/generated/src/models/model_GetColumnOutput.jl")
  include("c11_api/generated/src/models/model_GetRowInput.jl")
  include("c11_api/generated/src/models/model_GetRowOutput.jl")
  include("c11_api/generated/src/models/model_InRandomOrderInput.jl")
  include("c11_api/generated/src/models/model_InterquartileRangeInput.jl")
  include("c11_api/generated/src/models/model_MagnitudeInput.jl")
  include("c11_api/generated/src/models/model_MatrixAddInput.jl")
  include("c11_api/generated/src/models/model_MaximizeBatchInput.jl")
  include("c11_api/generated/src/models/model_MaximizeBatchOutput.jl")
  include("c11_api/generated/src/models/model_MaximizeStochasticInput.jl")
  include("c11_api/generated/src/models/model_MaximizeStochasticOutput.jl")
  include("c11_api/generated/src/models/model_MeanInput.jl")
  include("c11_api/generated/src/models/model_MedianInput.jl")
  include("c11_api/generated/src/models/model_MinimizeBatchInput.jl")
  include("c11_api/generated/src/models/model_MinimizeBatchOutput.jl")
  include("c11_api/generated/src/models/model_MinimizeStochasticInput.jl")
  include("c11_api/generated/src/models/model_MinimizeStochasticOutput.jl")
  include("c11_api/generated/src/models/model_ModeInput.jl")
  include("c11_api/generated/src/models/model_Order.jl")
  include("c11_api/generated/src/models/model_PartialDifferenceQuotientInput.jl")
  include("c11_api/generated/src/models/model_PartialDifferenceQuotientOutput.jl")
  include("c11_api/generated/src/models/model_Pet.jl")
  include("c11_api/generated/src/models/model_PrecisionInput.jl")
  include("c11_api/generated/src/models/model_QuantileInput.jl")
  include("c11_api/generated/src/models/model_RecallInput.jl")
  include("c11_api/generated/src/models/model_ScalarMultiplyInput.jl")
  include("c11_api/generated/src/models/model_ShapeInput.jl")
  include("c11_api/generated/src/models/model_ShapeOutput.jl")
  include("c11_api/generated/src/models/model_SplitDataInput.jl")
  include("c11_api/generated/src/models/model_SplitDataOutput.jl")
  include("c11_api/generated/src/models/model_SqrtInput.jl")
  include("c11_api/generated/src/models/model_SqrtOutput.jl")
  include("c11_api/generated/src/models/model_SquaredDistanceInput.jl")
  include("c11_api/generated/src/models/model_StandardDeviationInput.jl")
  include("c11_api/generated/src/models/model_StrengthInput.jl")
  include("c11_api/generated/src/models/model_StrengthOutput.jl")
  include("c11_api/generated/src/models/model_SumOfSquaresInput.jl")
  include("c11_api/generated/src/models/model_Tag.jl")
  include("c11_api/generated/src/models/model_TrainTestSplitInput.jl")
  include("c11_api/generated/src/models/model_TrainTestSplitOutput.jl")
  include("c11_api/generated/src/models/model_User.jl")
  include("c11_api/generated/src/models/model_VarianceInput.jl")
  include("c11_api/generated/src/models/model_VectorAddInput.jl")
  include("c11_api/generated/src/models/model_VectorMeanInput.jl")
  include("c11_api/generated/src/models/model_VectorSubtractInput.jl")
  include("c11_api/generated/src/models/model_VectorSumInput.jl")
  include("c11_api/generated/src/server.jl")
  include("c11_api/generated/src/statisticsWithJuliaAPI.jl")
end