# Using copy() and deepcopy() with a DataFrame

using DataFrames
using CSV
using io_library: read_purchaseData

function create_a_reference(data1)
    # create a reference
    data2 = data1 # data2 refers to the same object as data1.
    data2.Name[1] = "EMILY" # modifying data2 modifies data1.
    return data1
end
function create_a_shallow_copy1(data1)
    # create a shallow copy
    data2 = copy(data1)
    data2.Name[1] = "EMILY" # does not affect data1.
    return data1
end
function create_a_shallow_copy2(data1)
    # a shallow copy isn’t enough for separating data frames.
    # where we create a data frame with a column named X comprised of arrays.
    # In this case, the copied data frame, data2, still refers to the original entries (arrays),
    data2 = copy(data1)
    # because these are mutable and were not copied
    # modifying a specific entry of data2 modifies data1.
    data2.X[1][1] = -1
    return data1
    end

function create_a_deep_copy(data1)
    # This is then circumvented by using deepcopy() as in lines 21–24.
    data2 = deepcopy(data1)
    data2.X[1][1] = -1
    return data1
end

function main_l0406_dataframeCopyDeepCopy()
    # create a data frame from a csv file where data1.Name[1] is the string MARYANNA.
    path_to_here = @__DIR__
    path_to_data = abspath("$path_to_here/../../data")
    data1 = read_purchaseData("$path_to_data/purchaseData.csv")
    println("Original value: ", data1.Name[1])
    data1 = create_a_reference(data1)
    @show data1.Name[1]
    data1 = create_a_shallow_copy1(data1)
    @show data1.Name[1]
    data1 = DataFrame()
    data1.X = [[0, 1], [100, 101]]
    data1 = create_a_shallow_copy2(data1)
    @show data1.X[1][1]
    data1 = DataFrame(X = [[0, 1], [100, 101]])
    data1 = create_a_deep_copy(data1)
    @show data1.X[1][1]
end

if abspath(PROGRAM_FILE) == @__FILE__
    main_l0406_dataframeCopyDeepCopy()
end

export create_a_reference
export create_a_shallow_copy1
export create_a_shallow_copy2
export create_a_deep_copy


