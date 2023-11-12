using Random

function really_rand()
    return (rand(), rand(), rand())
end

function main()
    Random.seed!(1974)
    println("Seed 1974: ", really_rand())
    Random.seed!(1975)
    println("Seed 1975: ", really_rand())
    Random.seed!(1974)
    println("Seed 1974: ", really_rand())
end


using Test


@testset "Test set_seed_and_generate function" begin
    Random.seed!(1974)
    output = really_rand()
    output = round.(output,digits=2)
    expected_output = (0.21, 0.13, 0.50)
    @test output == expected_output
end

@testset "Test set_seed_and_generate function" begin
    Random.seed!(1975)
    output = really_rand()
    output = round.(output,digits=2)
    expected_output = (0.77, 0.87, 0.58)
    @test output == expected_output
end

