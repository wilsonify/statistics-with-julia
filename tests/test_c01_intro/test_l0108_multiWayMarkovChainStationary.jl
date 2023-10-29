using LinearAlgebra, StatsBase

function calculate_steady_state_matrix_exponentiation(P, n)
    return (P^n)[1, :]
end

function calculate_steady_state_linear_system(P)
    A = vcat((P' - I)[1:2, :], ones(3)')
    b = [0 0 1]'
    return A \ b
end

function calculate_steady_state_eigenvalues(P)
    eigVecs = eigvecs(copy(P'))
    highestVec = eigVecs[:, findmax(abs.(eigvals(P)))[2]]
    return Array{Float64}(highestVec) / norm(highestVec, 1)
end

function calculate_steady_state_monte_carlo(P, N)
    numInState = zeros(Int, 3)
    state = 1
    for t in 1:N
        numInState[state] += 1
        global state = sample(1:3, weights(P[state, :]))
    end
    return numInState / N
end

function main()
    # Transition probability matrix
    P = [0.5 0.4 0.1;
         0.3 0.2 0.5;
         0.5 0.3 0.2]

    n = 100
    N = 10^6

    piProb1 = calculate_steady_state_matrix_exponentiation(P, n)
    piProb2 = calculate_steady_state_linear_system(P)
    piProb3 = calculate_steady_state_eigenvalues(P)
    piProb4 = calculate_steady_state_monte_carlo(P, N)

    # Display the results for each method
    @show [piProb1 piProb2 piProb3 piProb4]
end

if abspath(PROGRAM_FILE) == @__FILE__
    main()
end
