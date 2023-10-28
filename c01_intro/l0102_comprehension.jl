# Using a comprehension

function broadcast_round(arr)
    return round.(arr, digits = 2)
end

function comprehension_sqrt(arr)
    return [sqrt(i) for i in arr]
end

function comprehension_polynomial(arr)
    return [(2n + 1)^2 for n in arr]
end

function main()
    array1 = comprehension_polynomial(1:5)
    array2 = comprehension_sqrt(array1)
    println(typeof(1:5), "  ", typeof(array1), "  ", typeof(array2))
    1:5, array1, array2
end

if abspath(PROGRAM_FILE) == @__FILE__
    main()
end