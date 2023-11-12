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

function main()
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
    main()
end


using Test

# Define a test for the update_data_and_sum function
@testset "Test update_data_and_sum function" begin
    data = [1, 2, 3]
    s = 0
    beta, gamma = 2, 1

    s, data = update_data_and_sum(data, s, beta, gamma)

    @test s == 12  # The expected sum after updating data
    @test data == [-1, -2, -3]  # The expected updated data
end

# Define a test for the sum_data_in_function function
@testset "Test sum_data_in_function function" begin
    data = [1, 2, 3]
    gamma = 1

    s_in_function = sum_data_in_function(data, gamma)

    @test s_in_function == 9  # The expected sum calculated in the function
end


#1 2 3
#Sum of data in external scope: 12
#Sum of data in a function: -3
#s = 12