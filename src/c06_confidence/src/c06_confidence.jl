
module c06_confidence
    include("l0601_onePopVKnown.jl")
    include("l0602_onePopVUnknown.jl")
    include("l0603_twoPopVKnown.jl")
    include("l0604_twoPopMVUnknownAEqual.jl")
    include("l0605_twoPopMVUnknownAUnequal.jl")
    include("l0606_vDOF_comparison.jl")
    include("l0607_proportionCI.jl")
    include("l0608_proportionCIsampleSize.jl")
    include("l0609_propCIcoverageAccuracy.jl")
    include("l0610_varianceCI.jl")
    include("l0611_sampleVarDists.jl")
    include("l0612_varianceCIalphas.jl")
    include("l0613_bCI.jl")
    include("l0614_bootstrapCI.jl")
    include("l0615_predictionInterval.jl")
    include("l0616_credible.jl")
end