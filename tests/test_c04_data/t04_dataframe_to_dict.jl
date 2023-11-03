using DataFrames

function dataframe_to_dict(df::DataFrame)
    dict = Dict{Symbol, Vector{Any}}()
    for col in names(df)
        dict[Symbol(col)] = df[!, col]
    end
    return dict
end

function main()
    # Example usage:

    # Create a sample DataFrame
    df = DataFrame(Name = ["Mary", "John", "Alice"],
                   Age = [25, 30, 22],
                   Score = [95, 85, 90])

    # Convert the DataFrame to a dictionary of lists
    dict = dataframe_to_dict(df)

    # Display the dictionary
    println(dict)
end