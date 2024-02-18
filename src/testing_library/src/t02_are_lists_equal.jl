function are_lists_equal(list1, list2)
    # Check if the Lists have the same number elements
    if length(list1) != length(list2)
        println("Length $(length(list1)) != $(length(list2))")
        return false
    end

    # Check if the element types of the two lists are the same
    if eltype(list1) != eltype(list2)
        println("Type $(eltype(list1)) != $(eltype(list2))")
        return false
    end

    # Check if the values of the two lists are the same
    for (a, b) in zip(list1, list2)
        if ismissing(a) && ismissing(b)
            continue  # Both are missing, move on to the next element
        elseif a != b
            println("Value $(a) != $(b)")
            println("$list1 != $list2")
            return false  # Values are not equal, and not both missing
        end
    end

    return true
end

function is_all_approx_list(list1, list2, abs)
    # Check if the Lists have the same number elements
    if length(list1) != length(list2)
        println("Length $(length(list1)) != $(length(list2))")
        return false
    end

    # Check if the element types of the two lists are the same
    if eltype(list1) != eltype(list2)
        println("Type $(eltype(list1)) != $(eltype(list2))")
        return false
    end

    # Check if the values of the two lists are the same
    for (a, b) in zip(list1, list2)
        if ismissing(a) && ismissing(b)
            continue  # Both are missing, move on to the next element
        elseif ismissing(a) || ismissing(b)
            println("a $a")
            println("b $b")
            println("one is missing")
            return false  # One is missing while the other is not

        elseif isapprox(a, b, abs = abs)
            println("Value $(a) not approx $(b)")
            println("$list1 is not approx $list2")
            return false  # Values are not equal, and not both missing
        end
    end

    return true
end

export are_lists_equal
export is_all_approx_list
