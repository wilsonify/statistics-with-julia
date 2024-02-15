using Test

@time @testset "smoke Test" begin
    @test true
end
@time @testset "test_l0401_callByValueByReference.jl Tests" begin
    include("$(@__DIR__)/test_l0401_callByValueByReference.jl")
end
@time @testset "test_l0402_shallowDeepCopy.jl Tests" begin
    include("$(@__DIR__)/test_l0402_shallowDeepCopy.jl")
end
@time @testset "test_l0403_dataframeInspection.jl Tests" begin
    include("$(@__DIR__)/test_l0403_dataframeInspection.jl")
end
@time @testset "test_l0404_dataframeReferencing.jl Tests" begin
    include("$(@__DIR__)/test_l0404_dataframeReferencing.jl")
end
@time @testset "test_l0405_dataframeEditing.jl Tests" begin
    include("$(@__DIR__)/test_l0405_dataframeEditing.jl")
end
@time @testset "test_l0406_dataframeCopyDeepCopy.jl Tests" begin
    include("$(@__DIR__)/test_l0406_dataframeCopyDeepCopy.jl")
end
@time @testset "test_l0407_dataframeMissing.jl Tests" begin
    include("$(@__DIR__)/test_l0407_dataframeMissing.jl")
end
@time @testset "test_l0408_dataframeReshape.jl Tests" begin
    include("$(@__DIR__)/test_l0408_dataframeReshape.jl")
end
@time @testset "test_l0409_dataframeOperations.jl Tests" begin
    include("$(@__DIR__)/test_l0409_dataframeOperations.jl")
end
@time @testset "test_l0410_dataframeImputation.jl Tests" begin
    include("$(@__DIR__)/test_l0410_dataframeImputation.jl")
end
@time @testset "test_l0411_summarizingData.jl Tests" begin
    include("$(@__DIR__)/test_l0411_summarizingData.jl")
end
@time @testset "test_l0412_meanVectCovMatrixSummary.jl Tests" begin
    include("$(@__DIR__)/test_l0412_meanVectCovMatrixSummary.jl")
end
@time @testset "test_l0413_sampleCovarianceMatrix.jl Tests" begin
    include("$(@__DIR__)/test_l0413_sampleCovarianceMatrix.jl")
end
@time @testset "test_l0414_manualHistogram.jl Tests" begin
    include("$(@__DIR__)/test_l0414_manualHistogram.jl")
end
@time @testset "test_l0415_statsPlotsDensity.jl Tests" begin
    include("$(@__DIR__)/test_l0415_statsPlotsDensity.jl")
end
@time @testset "test_l0416_KDE.jl Tests" begin
    include("$(@__DIR__)/test_l0416_KDE.jl")
end
@time @testset "test_l0417_ecdf.jl Tests" begin
    include("$(@__DIR__)/test_l0417_ecdf.jl")
end
@time @testset "test_l0418_normalProbabilityPlot.jl Tests" begin
    include("$(@__DIR__)/test_l0418_normalProbabilityPlot.jl")
end
@time @testset "test_l0419_multipleSimplePlot.jl Tests" begin
    include("$(@__DIR__)/test_l0419_multipleSimplePlot.jl")
end
@time @testset "test_l0420_radialPlot.jl Tests" begin
    include("$(@__DIR__)/test_l0420_radialPlot.jl")
end
@time @testset "test_l0421_qqPlot.jl Tests" begin
    include("$(@__DIR__)/test_l0421_qqPlot.jl")
end
@time @testset "test_l0422_boxplot.jl Tests" begin
    include("$(@__DIR__)/test_l0422_boxplot.jl")
end
@time @testset "test_l0423_violinPlot.jl Tests" begin
    include("$(@__DIR__)/test_l0423_violinPlot.jl")
end
@time @testset "test_l0424_scatterplot.jl Tests" begin
    include("$(@__DIR__)/test_l0424_scatterplot.jl")
end
@time @testset "test_l0424_scatterplotMatrix.jl Tests" begin
    include("$(@__DIR__)/test_l0424_scatterplotMatrix.jl")
end
@time @testset "test_l0425_marginalHists.jl Tests" begin
    include("$(@__DIR__)/test_l0425_marginalHists.jl")
end
@time @testset "test_l0426_andrewsPlot.jl Tests" begin
    include("$(@__DIR__)/test_l0426_andrewsPlot.jl")
end
@time @testset "test_l0427_pieChart.jl Tests" begin
    include("$(@__DIR__)/test_l0427_pieChart.jl")
end
@time @testset "test_l0428_barPlots.jl Tests" begin
    include("$(@__DIR__)/test_l0428_barPlots.jl")
end
@time @testset "test_l0429_stackplot.jl Tests" begin
    include("$(@__DIR__)/test_l0429_stackplot.jl")
end
@time @testset "test_l0430_lineSearch.jl Tests" begin
    include("$(@__DIR__)/test_l0430_lineSearch.jl")
end
@time @testset "test_l0431_directorySearch.jl Tests" begin
    include("$(@__DIR__)/test_l0431_directorySearch.jl")
end
