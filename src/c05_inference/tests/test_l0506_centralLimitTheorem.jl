using Test
using Distributions, Plots; gr()
using c05_inference: generate_uniform
using c05_inference: generate_exponential
using c05_inference: generate_normal

@testset "generate_uniform" begin
    result = generate_uniform()
    @test length(result) == 10000000
end
@testset "generate_exponential" begin
    result = generate_exponential()
    @test length(result) == 10000000
end
@testset "generate_normal" begin
    result = generate_normal()
    @test length(result) == 10000000
end

@testset "end-to-end" begin
data1 = generate_uniform()
data2 = generate_exponential()
data3 = generate_normal()

stephist( [data1 data2 data3], bins = 100,
    c = [:blue :red :green], xlabel = "x", ylabel = "Density",
    label = ["Average of Uniforms" "Average of Exponentials" "Average of Normals"],
    normed = true, xlims = (0,2), ylims = (0,2.5))

end
