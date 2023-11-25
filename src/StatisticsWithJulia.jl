module StatisticsWithJulia
    include("c01_CallC/l0121_usingC.jl")
    export cos_c
    include("c01_intro/l0101_helloWorld.jl")
    export tab_separated_string
    export squares
    include("c01_intro/l0102_comprehension.jl")
    export comprehension_sqrt
    export comprehension_polynomial
    export broadcast_round
    include("c01_intro/l0103_slow.jl")
    export generate_random_data_slowly
    export calculate_quantiles
    include("c01_intro/l0104_fast.jl")
    export comprehension_generate_data
    export calculate_quantiles

end