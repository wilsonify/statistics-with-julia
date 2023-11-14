using Test
using SafeTestsets



@time @safetestset "smoke Test" begin
    println("VERSION = $VERSION")
    @test true
end

@time @safetestset "test_c01_CallC" begin
    path_to_here = @__DIR__
    include("$path_to_here/test_c01_CallC/test_l0121_usingC.jl")
    @test true
end

@time @safetestset "test_c01_intro" begin
    path_to_here = @__DIR__
    include("$path_to_here/test_c01_intro/runtests.jl")
    @test true
end

@time @safetestset "test_c02_probability" begin
    path_to_here = @__DIR__
    include("$path_to_here/test_c02_probability/runtests.jl")
    @test true
end

@time @safetestset "test_c03_distribution" begin
    path_to_here = @__DIR__
    include("$path_to_here/test_c03_distribution/runtests.jl")
    @test true
end
@time @safetestset "test_c04_data" begin
    path_to_here = @__DIR__
    include("$path_to_here/test_c04_data/runtests.jl")
    @test true
end
@time @safetestset "test_c05_inference" begin
    path_to_here = @__DIR__
    include("$path_to_here/test_c05_inference/runtests.jl")
    @test true
end
@time @safetestset "test_c06_confidence" begin
    path_to_here = @__DIR__
    include("$path_to_here/test_c06_confidence/runtests.jl")
    @test true
end
@time @safetestset "test_c07_hypothesis" begin
    path_to_here = @__DIR__
    include("$path_to_here/test_c07_hypothesis/runtests.jl")
    @test true
end
@time @safetestset "test_c08_regression" begin
    path_to_here = @__DIR__
    include("$path_to_here/test_c08_regression/runtests.jl")
    @test true
end
@time @safetestset "test_c09_machine_learning" begin
    path_to_here = @__DIR__
    include("$path_to_here/test_c09_machine_learning/runtests.jl")
    @test true
end
@time @safetestset "test_c10_simulation" begin
    path_to_here = @__DIR__
    include("$path_to_here/test_c10_simulation/runtests.jl")
    @test true
end
