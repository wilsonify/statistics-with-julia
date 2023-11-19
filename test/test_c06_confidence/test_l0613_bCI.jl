using DataFrames, Random, CSV, Distributions, Plots

path_to_here = @__DIR__
path_to_data = abspath("$path_to_here/../../data")

@testset "end_to_end" begin
Random.seed!(0)

sampleData = CSV.read("$path_to_data/machine1.csv", DataFrame, header = false)[:,1]
n, N = length(sampleData), 10^6
alpha = 0.1

bootstrapSampleMeans = [mean(rand(sampleData, n)) for i in 1:N]
Lmean = quantile(bootstrapSampleMeans, alpha / 2)
Umean = quantile(bootstrapSampleMeans, 1 - alpha / 2)

bootstrapSampleMedians = [median(rand(sampleData, n)) for i in 1:N]
Lmed = quantile(bootstrapSampleMedians, alpha / 2)
Umed = quantile(bootstrapSampleMedians, 1 - alpha / 2)

mean_interval = (Lmean, Umean)
mean_interval = round.(mean_interval,digits = 2)
@test mean_interval == (52.53, 53.38)

med_interval = (Lmed, Umed)
med_interval = round.(med_interval,digits = 2)
@test med_interval == (52.37, 53.49)

stephist(bootstrapSampleMeans, bins = 1000, c = :blue,    normed = true, label = "Sample \nmeans")
plot!([Lmean, Lmean],[0, 2], c = :black, ls = :dash, label = "90% CI")
plot!([Umean, Umean],[0, 2],c = :black, ls = :dash, label = "",    xlims = (52,54), ylims = (0,2), xlabel = "Sample Means", ylabel = "Density")
end