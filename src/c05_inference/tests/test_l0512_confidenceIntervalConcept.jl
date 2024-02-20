using Test
using c05_inference: L1
using c05_inference: U1
using c05_inference: generate_data_triangle
using c05_inference: main_l0512_confidenceIntervalConcept

main_l0512_confidenceIntervalConcept()

@testset "end_to_end" begin
    observation = generate_data_triangle(5.57)
    Lower_bound = round(L1(observation),digits = 2)
    Upper_bound = round(U1(observation),digits = 2)
    @test Lower_bound < Upper_bound
end
