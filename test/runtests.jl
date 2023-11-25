using Test

@time @testset "smoke Test" begin
    println("VERSION = $VERSION")
    @test true
end

@time @testset "test_c01_CallC" begin
    include("$(@__DIR__)/test_c01_CallC/runtests.jl")
    @test true
end

@time @testset "test_c01_CallPython" begin
    include("$(@__DIR__)/test_c01_CallPython/runtests.jl")
    @test true
end

@time @testset "test_c01_intro" begin
    include("$(@__DIR__)/test_c01_intro/runtests.jl")
    @test true
end

# @time @testset "test_c02_probability" begin
#
#     include("$(@__DIR__)/test_c02_probability/runtests.jl")
#     @test true
# end
#
# @time @testset "test_c03_distribution" begin
#
#     include("$(@__DIR__)/test_c03_distribution/runtests.jl")
#     @test true
# end
# @time @testset "test_c04_data" begin
#
#     include("$(@__DIR__)/test_c04_data/runtests.jl")
#     @test true
# end
# @time @testset "test_c05_inference" begin
#
#     include("$(@__DIR__)/test_c05_inference/runtests.jl")
#     @test true
# end
# @time @testset "test_c06_confidence" begin
#
#     include("$(@__DIR__)/test_c06_confidence/runtests.jl")
#     @test true
# end
# @time @testset "test_c07_hypothesis" begin
#
#     include("$(@__DIR__)/test_c07_hypothesis/runtests.jl")
#     @test true
# end
# @time @testset "test_c08_regression" begin
#
#     include("$(@__DIR__)/test_c08_regression/runtests.jl")
#     @test true
# end
# @time @testset "test_c09_machine_learning" begin
#
#     include("$(@__DIR__)/test_c09_machine_learning/runtests.jl")
#     @test true
# end
# @time @testset "test_c10_simulation" begin
#
#     include("$(@__DIR__)/test_c10_simulation/runtests.jl")
#     @test true
# end
