using CSV, DataFrames, RCall

function read_machine_data(machine_number)
    path_to_data = abspath("../data")
    filename = "machine$machine_number.csv"
    data = CSV.read(joinpath(path_to_data, filename), DataFrame, header = false)[:, 1]
    return data
end

function r_anova(data)
    df = DataFrame(Diameter = vcat(data...), MachNo = repeat(1:length(data), lengths(data)))
    @rput df

    R"""
    df$MachNo <- as.factor(df$MachNo)
    anova <- summary(aov(Diameter ~ MachNo, data = df))
    fVal <- anova[[1]]["F value"][[1]][1]
    pVal <- anova[[1]]["Pr(>F)"][[1]][1]
    """
    println("R ANOVA f-value: ", @rget fVal)
    println("R ANOVA p-value: ", @rget pVal)
end

function main()
    data1 = read_machine_data(1)
    data2 = read_machine_data(2)
    data3 = read_machine_data(3)

    r_anova([data1, data2, data3])
end

using Test

# Define a test for the read_machine_data function
@testset "Test read_machine_data function" begin
    machine1_data = read_machine_data(1)
    machine2_data = read_machine_data(2)
    machine3_data = read_machine_data(3)

    @test typeof(machine1_data) == Vector{Float64}
    @test typeof(machine2_data) == Vector{Float64}
    @test typeof(machine3_data) == Vector{Float64}

    @test length(machine1_data) > 0
    @test length(machine2_data) > 0
    @test length(machine3_data) > 0
end

# Define a test for the r_anova function
@testset "Test r_anova function" begin
    # Generate synthetic data for testing
    data1 = [1.0, 2.0, 3.0, 4.0, 5.0]
    data2 = [2.0, 3.0, 4.0, 5.0, 6.0]
    data3 = [3.0, 4.0, 5.0, 6.0, 7.0]

    # Call the r_anova function with synthetic data
    r_anova([data1, data2, data3])

    # Add assertions to check the output or behavior
    # For example, you can check the f-value and p-value.
end
