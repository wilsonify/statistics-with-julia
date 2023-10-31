# Independent events
using Random
Random.seed!(1)

numberchoice(range_of_choices) = rand(range_of_choices)
firstDigit(x) = Int(floor(x / 10))
secondDigit(x) = x % 10
isThirteen(x) = x == 13

function simulation(N)
    numThirteen, numFirstIsOne, numSecondIsThree = 0, 0, 0
    for _ in 1:N
        X = numberchoice(10:25)
        numThirteen += isThirteen(X)
        numFirstIsOne += firstDigit(X) == 1
        numSecondIsThree += secondDigit(X) == 3
    end
   probThirteen, probFirstIsOne, probSecondIsThree = (numThirteen,numFirstIsOne,numSecondIsThree)./N
   probThirteen = round(probThirteen,digits=4)
   probFirstIsOne = round(probFirstIsOne,digits=4)
   probSecondIsThree = round(probSecondIsThree,digits=4)
   return probThirteen, probFirstIsOne, probSecondIsThree
end

function main()
    probThirteen, probFirstIsOne, probSecondIsThree = simulation(10^7)
    probJoint = probFirstIsOne*probSecondIsThree
    println("P(13) = $probThirteen")
    println("P(1_) = $probFirstIsOne")
    println("P(_3) = $probSecondIsThree")
    println("P(1_)*P(_3) = $probJoint")
end

using Test

@testset "test_independent_events" begin
    Random.seed!(12)
    probThirteen, probFirstIsOne, probSecondIsThree = simulation(10^7)
    @test isapprox(probThirteen, 0.0625, atol=0.01)
    @test isapprox(probFirstIsOne, 0.625, atol=0.01)
    @test isapprox(probSecondIsThree, 0.125, atol=0.01)
    @test isapprox(probFirstIsOne * probSecondIsThree, 0.0781, atol=0.01)
end


