# Fast code example
using Statistics

function comprehension_generate_data(nrows,ncols)
    data = [mean(rand(ncols)) for _ in 1:nrows]
    return data
end

function summarize_data(data)
    return (quantile(data,0.01), quantile(data,0.99))
end

function main()
@time begin
    data = comprehension_generate_data(10^6, 5 * 10^2)
    summary = summarize_data(data)
    println("98% of the means lie in the estimated range: ", summary)
end
end

if abspath(PROGRAM_FILE) == @__FILE__
    main()
end