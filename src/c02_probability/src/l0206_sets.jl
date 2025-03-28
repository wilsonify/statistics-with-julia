# Basic set operations
function main_set_examples()
    A = Set([2, 7, 2, 3])
    B = Set(1:6)
    omega = Set(1:10)
    AunionB = union(A, B)
    AintersectionB = intersect(A, B)
    BdifferenceA = setdiff(B,A)
    Bcomplement = setdiff(omega,B)
    AsymDifferenceB = union(setdiff(A,B),setdiff(B,A))
    println("A = $A, B = $B")
    println("A union B = $AunionB")
    println("A intersection B = $AintersectionB")
    println("B diff A = $BdifferenceA")
    println("B complement = $Bcomplement")
    println("A symDifference B = $AsymDifferenceB")
    println("The element '6' is an element of A: $(in(6,A))")
    println("Symmetric difference and intersection are subsets of the union: ", issubset(AsymDifferenceB,AunionB),", ", issubset(AintersectionB,AunionB))
end

if abspath(PROGRAM_FILE) == @__FILE__
    main_set_examples()
end