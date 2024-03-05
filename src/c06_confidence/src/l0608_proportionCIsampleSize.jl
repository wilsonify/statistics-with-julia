#=
Sample size planning for proportions
=#

function proportions_sample_size(eps)
    # proportions sample size formula
    n = ceil(1 / eps^2)
end

function main_l0608_proportionCIsampleSize()
    for eps in [0.1, 0.05, 0.02, 0.01]
        n = ceil(1 / eps^2)
        println("For epsilon = $eps set n = $n")
    end
end

export proportions_sample_size