# Bubble sort
function bubbleSort!(a)
    # by convention, ! indicates that the function may modify its arguments
    n = length(a)
    for i in 1:n - 1
        for j in 1:n - i
            if a[j] > a[j + 1]
                a[j], a[j + 1] = a[j + 1], a[j]
            end
        end
    end
    return a
end

function main_bubbleSort()
    data = [65, 51, 32, 12, 23, 84, 68, 1]
    bubbleSort!(data)
end

export bubbleSort!