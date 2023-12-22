# Deep copy and shallow copy

function immutable_behavior(a)
    b = a # Julia creates a copy because the variable is immutable
    b = 20 # modify b
    return a # does not modify a
end

function no_copy_behavior(a)
    b = a # b is assigned to a
    b[1] = 20 # b is modified
    return a # a is also modified
end

function shallow_copy_outer_behavior(a)
    b = copy(a) # copy() of a
    b[1] = 20 # b is modified
    return a # a is not modified
end

function shallow_copy_inner_behavior(a)
    b = copy(a) # a shallow copy
    b[1][1] = 20 # the inner array is is modified
    return a # the inner array of a is modified
end

function deep_copy_behavior(a)
    b = deepcopy(a) # a deep copy.
    b[1][1] = 20 # b is modified
    return a # a is not modified
end

function main_l0402_shallowDeepCopy()
    println("Immutable: no surprise")
    a = 10 # Int64 is Immutable
    a = immutable_behavior(a)
    @show a # does not modify a

    println("demonstrate No copy behavior")
    a = [10] # array is mutable
    a = no_copy_behavior(a)
    @show a # a is also modified

    println("Shallow Copy Outer")
    a = [10] # array is mutable
    a = shallow_copy_outer_behavior(a)
    @show a # a is not modified

    println("Shallow copy Inner")
    a = [[10]] # array is mutable
    a = shallow_copy_inner_behavior(a)
    @show a # the inner array of a is modified

    println("Deep copy")
    a = [[10]] # array is mutable
    a = deep_copy_behavior(a)
    @show a # a is not modified
end

if abspath(PROGRAM_FILE) == @__FILE__
    main_l0402_shallowDeepCopy()
end

export immutable_behavior
export no_copy_behavior
export shallow_copy_outer_behavior
export shallow_copy_inner_behavior
export deep_copy_behavior
