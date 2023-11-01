using RDatasets, StatsPlots; pyplot()
function main()
iris = dataset("datasets", "iris")
@df iris andrewsplot(:Species, cols(1:4), 
    line = (fill = [:blue :red :green]), legend = :topleft)

end