using Test
using SafeTestsets

@time @safetestset "smoke Test" begin
    @test true
    end

@time @safetestset "test_l0701_infMeanSingleVarKnown.jl" begin
    path_to_here = @__DIR__
    include("$path_to_here/test_l0701_infMeanSingleVarKnown.jl")
    end
@time @safetestset "test_l0702_infMeanSingleVarUnknown.jl" begin
    path_to_here = @__DIR__
    include("$path_to_here/test_l0702_infMeanSingleVarUnknown.jl")
    end
@time @safetestset "test_l0703_signTest.jl" begin
    path_to_here = @__DIR__
    include("$path_to_here/test_l0703_signTest.jl")
    end
@time @safetestset "test_l0704_TvsSign.jl" begin
    path_to_here = @__DIR__
    include("$path_to_here/test_l0704_TvsSign.jl")
    end
@time @safetestset "test_l0705_infMeanDiffVarKnown.jl" begin
    path_to_here = @__DIR__
    include("$path_to_here/test_l0705_infMeanDiffVarKnown.jl")
    end
@time @safetestset "test_l0706_infMeanDiffVarAssumedEqual.jl" begin
    path_to_here = @__DIR__
    include("$path_to_here/test_l0706_infMeanDiffVarAssumedEqual.jl")
    end
@time @safetestset "test_l0707_infMeanDiffVarAssumedUnequal.jl" begin
    path_to_here = @__DIR__
    include("$path_to_here/test_l0707_infMeanDiffVarAssumedUnequal.jl")
    end
@time @safetestset "test_l0708_dataBoxPlot.jl" begin
    path_to_here = @__DIR__
    include("$path_to_here/test_l0708_dataBoxPlot.jl")
    end
@time @safetestset "test_l0708_sampleMeansANOVA.jl" begin
    path_to_here = @__DIR__
    include("$path_to_here/test_l0708_sampleMeansANOVA.jl")
    end
@time @safetestset "test_l0709_ssDecomposition.jl" begin
    path_to_here = @__DIR__
    include("$path_to_here/test_l0709_ssDecomposition.jl")
    end
@time @safetestset "test_l0710_anovaFTest.jl" begin
    path_to_here = @__DIR__
    include("$path_to_here/test_l0710_anovaFTest.jl")
    end
@time @safetestset "test_l0711_anovaFDistribution.jl" begin
    path_to_here = @__DIR__
    include("$path_to_here/test_l0711_anovaFDistribution.jl")
    end
@time @safetestset "test_l0712_chiSqTest.jl" begin
    path_to_here = @__DIR__
    include("$path_to_here/test_l0712_chiSqTest.jl")
    end
@time @safetestset "test_l0713_chiSqIndependence.jl" begin
    path_to_here = @__DIR__
    include("$path_to_here/test_l0713_chiSqIndependence.jl")
    end
@time @safetestset "test_l0714_ksStatistic.jl" begin
    path_to_here = @__DIR__
    include("$path_to_here/test_l0714_ksStatistic.jl")
    end
@time @safetestset "test_l0715_ksBrownian.jl" begin
    path_to_here = @__DIR__
    include("$path_to_here/test_l0715_ksBrownian.jl")
    end
@time @safetestset "test_l0716_wald_wolfowitz.jl" begin
    path_to_here = @__DIR__
    include("$path_to_here/test_l0716_wald_wolfowitz.jl")
    end
@time @safetestset "test_l0717_power.jl" begin
    path_to_here = @__DIR__
    include("$path_to_here/test_l0717_power.jl")
    end
@time @safetestset "test_l0718_powerCurves.jl" begin
    path_to_here = @__DIR__
    include("$path_to_here/test_l0718_powerCurves.jl")
    end
@time @safetestset "test_l0719_pValDist.jl" begin
    path_to_here = @__DIR__
    include("$path_to_here/test_l0719_pValDist.jl")
    end