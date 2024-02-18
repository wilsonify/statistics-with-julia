using StatisticsWithJulia.c01_intro: update_data_and_sum
using StatisticsWithJulia.c01_intro: sum_data_in_function
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
