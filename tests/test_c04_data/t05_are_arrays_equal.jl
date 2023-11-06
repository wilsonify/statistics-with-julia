function is_all_approx_array()
    for i in 1:size(result, 1), j in 1:size(result, 2)
        @test isapprox(result[i, j], expected_result[i, j], atol=0.01)
    end
end

function is_array_equal()
    for i in 1:size(result, 1), j in 1:size(result, 2)
        @test isapprox(result[i, j], expected_result[i, j], atol=0.01)
    end
end
