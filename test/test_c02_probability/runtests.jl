using Test



@time @testset "smoke Test" begin
    @test true
end

@time @testset "l0201_diceSumEven.jl Tests" begin
    path_to_here = @__DIR__
    include("$path_to_here/test_l0201_diceSumEven.jl")
end
@time @testset "l0202_passwords.jl Tests" begin
    path_to_here = @__DIR__
    include("$path_to_here/test_l0202_passwords.jl")
end
@time @testset "l0203_birthdayProblem.jl Tests" begin
    path_to_here = @__DIR__
    include("$path_to_here/test_l0203_birthdayProblem.jl")
end
@time @testset "l0204_fishing.jl Tests" begin
    path_to_here = @__DIR__
    include("$path_to_here/test_l0204_fishing.jl")
end
@time @testset "l0205_catalan.jl Tests" begin
    path_to_here = @__DIR__
    include("$path_to_here/test_l0205_catalan.jl")
end
@time @testset "l0206_sets.jl Tests" begin
    path_to_here = @__DIR__
    include("$path_to_here/test_l0206_sets.jl")
end
@time @testset "l0207_mcFalacy.jl Tests" begin
    path_to_here = @__DIR__
    include("$path_to_here/test_l0207_mcFalacy.jl")
end
@time @testset "l0208_secretaryEnvelopes.jl Tests" begin
    path_to_here = @__DIR__
    include("$path_to_here/test_l0208_secretaryEnvelopes.jl")
end
@time @testset "l0209_occupancyProblem.jl Tests" begin
    path_to_here = @__DIR__
    include("$path_to_here/test_l0209_occupancyProblem.jl")
end
@time @testset "l0210_independence.jl Tests" begin
    path_to_here = @__DIR__
    include("$path_to_here/test_l0210_independence.jl")
end
@time @testset "l0211_conditionalProbability.jl Tests" begin
    path_to_here = @__DIR__
    include("$path_to_here/test_l0211_conditionalProbability.jl")
end

@time @testset "l0212_txRxBayes.jl Tests" begin
    path_to_here = @__DIR__
    include("$path_to_here/test_l0212_txRxBayes.jl")
end
@time @testset "l0213_montyHall.jl Tests" begin
    path_to_here = @__DIR__
    include("$path_to_here/test_l0213_montyHall.jl")
end
