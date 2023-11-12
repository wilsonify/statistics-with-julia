using Test
using SafeTestsets
println(versioninfo())
@time @safetestset "smoke Test" begin
    println("VERSION = $VERSION")
    @test true
end


