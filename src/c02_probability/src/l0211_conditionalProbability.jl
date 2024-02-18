# Defects in manufacturing
# consider the world of semi-conductor manufacturing.
# Room cleanliness in the manufacturing process is critical,
# and dust particles are kept to a minimum.
# Let A be the event of a manufacturing failure,
# it depends on the number of dust particles
# where B_k is the event of having k dust particles in the room
# the infinite sum can be approximated using the Riemann Zeta Function

using SpecialFunctions

probDefectiveGivenParticles(k) = 1 - 1 / (k + 1)
probParticles(k) = 6 / (pi * (k + 1))^2

function main_conditional_probability()
    n = 2000
    numerical = sum([probDefectiveGivenParticles(k) * probParticles(k) for k in 0:n])
    analytic = 1 - 6 * zeta(3) / pi^2
    println("Analytic: ", analytic, "\tNumerical: ", numerical)
end

if abspath(PROGRAM_FILE) == @__FILE__
    main_conditional_probability()
end

export probDefectiveGivenParticles
export probParticles
