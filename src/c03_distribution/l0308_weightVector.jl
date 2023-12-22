# Sampling from a weight vector
using StatsBase, Random

function count_occurance(data)
    possible_events=unique(data)
    N = length(data)
    return [count(i->(i == g),data) for g in possible_events] / N
end

function main_l0308_weightVector()
    Random.seed!(1)
    N = 10^6

    # define an array of possible outcomes.
    grade = ["A", "B", "C", "D", "E"]

    # define their weights.
    # Note the fact that Weights() is capitalized,
    # signifying a Constructor which creates a new object.
    weightVect = Weights([0.1, 0.2, 0.1, 0.2, 0.4])

    # sample N observations from our array grade, according to their weights.
    data = sample(grade,weightVect,N)

    # count how many times each entry occurs in data,
    # then evaluates the proportion of times total each grade occurs.
    result = count_occurance(data)
    print("occurances=$result")
    # the grades have been sampled according to the probabilities specified in weightVect.
    # Note that you can also use the Categorical() object in the Distributions package

end
if abspath(PROGRAM_FILE) == @__FILE__
    main_l0308_weightVector()
end