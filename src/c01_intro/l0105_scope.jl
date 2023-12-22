function update_data_and_sum(data, s, beta, gamma)
    for i in 1:length(data)
        s += beta * data[i]
        data[i] *= -1
    end
    return s, data
end

function sum_data_in_function(data, gamma)
    s = 0
    for i in 1:length(data)
        s += data[i] + gamma
    end
    return s
end

function main_scope()
    data = [1, 2, 3]
    s = 0
    beta, gamma = 2, 1

    println("Updating data and sum in a loop:")
    s, data = update_data_and_sum(data, s, beta, gamma)

    println("Sum of data in external scope: ", s)

    println("Summing data in a function:")
    s_in_function = sum_data_in_function(data, gamma)
    println("Sum of data in a function: ", s_in_function)

    @show s
end

if abspath(PROGRAM_FILE) == @__FILE__
    main_scope()
end

export update_data_and_sum
export sum_data_in_function
