using Statistics

function generate_random_data(num_groups, group_size)
    data = Float64[]
    for _ in 1:num_groups
        group = Float64[]
        for _ in 1:group_size
            push!(group, rand())
        end
        push!(data, mean(group))
    end
    return data
end

function calculate_quantiles(data)
    quantile_01 = quantile(data, 0.01)
    quantile_99 = quantile(data, 0.99)
    return quantile_01, quantile_99
end

function main()
    num_groups = 10^6
    group_size = 5 * 10^2

    println("Generating random data...")
    data = generate_random_data(num_groups, group_size)

    println("Calculating quantiles...")
    quantile_01, quantile_99 = calculate_quantiles(data)

    println("98% of the means lie in the estimated range: ", (quantile_01, quantile_99))
end

if abspath(PROGRAM_FILE) == @__FILE__
    @time main()
end
