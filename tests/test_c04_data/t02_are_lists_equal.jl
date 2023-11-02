function are_lists_equal(list1, list2)
    # Check if the Lists have the same number elements
    if length(list1) != length(list2)
        return false
    end

    # Check if the element types of the two lists are the same
    if eltype(list1) != eltype(list2)
        return false
    end

    # Check if the values of the two lists are the same
    for (a, b) in zip(list1, list2)
        if ismissing(a) && ismissing(b)
            continue  # Both are missing, move on to the next element
        elseif a != b
            return false  # Values are not equal, and not both missing
        end
    end

    return true
end