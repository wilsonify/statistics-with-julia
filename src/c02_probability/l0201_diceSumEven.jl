
function even_sum_probability()
    N, faces = 10^6, 1:6
    numSol = sum([iseven(i + j) for i in faces, j in faces]) / length(faces)^2
    mcEst = sum([iseven(rand(faces) + rand(faces)) for i in 1:N]) / N
    return numSol, mcEst
end
if abspath(PROGRAM_FILE) == @__FILE__
    even_sum_probability()
end

export even_sum_probability