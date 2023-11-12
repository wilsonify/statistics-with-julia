using Distributions, Plots; pyplot()
n, N = 30, 10^6

function generate_uniform()
    dist = Uniform(1 - sqrt(3),1 + sqrt(3))
    data = [mean(rand(dist,n)) for _ in 1:N]
    return data
end

function generate_exponential()
    dist = Exponential(1)
    data = [mean(rand(dist,n)) for _ in 1:N]
    return data
end

function generate_normal()
    dist = Normal(1,1)
    data = [mean(rand(dist,n)) for _ in 1:N]
    return data
end

using Test
@testset "generate_uniform" begin
    result = generate_uniform()
    @test length(result) == N
end
@testset "generate_exponential" begin
    result = generate_exponential()
    @test length(result) == N
end
@testset "generate_normal" begin
    result = generate_normal()
    @test length(result) == N
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