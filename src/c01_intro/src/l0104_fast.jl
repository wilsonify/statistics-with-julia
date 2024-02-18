# Fast code example
using Statistics

function comprehension_generate_data(num_groups, group_size)
    data = [mean(rand(group_size)) for _ in 1:num_groups]
    return data
end

function main_comprehension_fast()
    @time begin
        data = comprehension_generate_data(10^6, 5 * 10^2)
        summary = calculate_quantiles(data)
        println("98% of the means lie in the estimated range: ", summary)
    end
end

if abspath(PROGRAM_FILE) == @__FILE__
    main_comprehension_fast()
end

export comprehension_generate_data
export calculate_quantiles
