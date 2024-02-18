# Expectation via numerical integration
using QuadGK

expect(f, support) = quadgk((x) -> x*f(x),support...)[1]

function main_l0303_meanIntegration()
    f1(x) = 3 / 4 * (1 - x^2)
    f2(x) = x < 0 ? x + 1 : 1 - x
    sup = (-1,1)
    println("Mean 1: ", expect(f1,sup))
    println("Mean 2: ", expect(f2,sup))
end

if abspath(PROGRAM_FILE) == @__FILE__
    main_l0303_meanIntegration()
end

export expect
