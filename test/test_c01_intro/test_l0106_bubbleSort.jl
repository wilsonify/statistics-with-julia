

function bubbleSort!(a)
    n = length(a)
    for i in 1:n - 1
        for j in 1:n - i
            if a[j] > a[j + 1]
                a[j], a[j + 1] = a[j + 1], a[j]
            end
        end
    end
    return a
end

# Tests for Bubble sort
using Test

@testset "Test bubbleSort function" begin
    data = [65, 51, 32, 12, 23, 84, 68, 1]
    result = bubbleSort!(data)
    @test result == [1, 12, 23, 32, 51, 65, 68, 84]
end