# Descriptors of Distribution objects
using c03_distribution: getDescriptors
using Distributions
using Test

@testset "getDescriptors" begin
    dist = TriangularDist(0,2,1)
    result = getDescriptors(dist)
    expected_result = Dict(
        :Parameters => (0.0, 2.0, 1.0),
        :CentralTendency => (1.0,1.0),
        :Dispersion => (0.17,0.41),
        :HigherMomentShape => (0.0,-0.6),
        :ValueRange => (0.0,2.0),
        :Mode => (1.0,[1.0])
    )
    @test result == expected_result
end