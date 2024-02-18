
module c06_confidence
    include("c06_confidence/l0601_onePopVKnown.jl")
    include("c06_confidence/l0602_onePopVUnknown.jl")
    include("c06_confidence/l0603_twoPopVKnown.jl")
    include("c06_confidence/l0604_twoPopMVUnknownAEqual.jl")
    include("c06_confidence/l0605_twoPopMVUnknownAUnequal.jl")
    include("c06_confidence/l0606_vDOF_comparison.jl")
    include("c06_confidence/l0607_proportionCI.jl")
    include("c06_confidence/l0608_proportionCIsampleSize.jl")
    include("c06_confidence/l0609_propCIcoverageAccuracy.jl")
    include("c06_confidence/l0610_varianceCI.jl")
    include("c06_confidence/l0611_sampleVarDists.jl")
    include("c06_confidence/l0612_varianceCIalphas.jl")
    include("c06_confidence/l0613_bCI.jl")
    include("c06_confidence/l0614_bootstrapCI.jl")
    include("c06_confidence/l0615_predictionInterval.jl")
    include("c06_confidence/l0616_credible.jl")#
    include("c06_confidence/testcases_z.jl")
end