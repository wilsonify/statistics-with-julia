# Fast code example
using Statistics, Test

function comprehension_generate_data(num_groups, group_size)
    data = [mean(rand(group_size)) for _ in 1:num_groups]
    return data
end

function calculate_quantiles(data)
    quantile_01 = quantile(data, 0.01)
    quantile_99 = quantile(data, 0.99)
    return quantile_01, quantile_99
end

function main_comprehension()
    @time begin
        data = comprehension_generate_data(10^6, 5 * 10^2)
        summary = calculate_quantiles(data)
        println("98% of the means lie in the estimated range: ", summary)
    end
end

if abspath(PROGRAM_FILE) == @__FILE__
    main_comprehension()
end