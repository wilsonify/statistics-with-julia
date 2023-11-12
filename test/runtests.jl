using Test
using SafeTestsets

@time @safetestset "smoke Test" begin
    println("VERSION = $VERSION")
    @test true
end


