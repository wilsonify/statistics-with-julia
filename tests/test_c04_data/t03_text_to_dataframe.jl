using CSV, DataFrames

function text_to_dataframe(text)
    # Split the text into lines
    lines = split(text, "\n")

    # Initialize an empty dictionary to store column data
    data_dict = Dict{String, Any}()
    data_dict["Row"] = Int[]
    data_dict["Name"] = String[]
    data_dict["Date"] = Date[]
    data_dict["Grade"] = String[]
    data_dict["Price"] = Int[]

    # Parse each line and extract values
    for line in lines
        parts = split(line, ' ')
        push!(data_dict["Row"], parse(Int, parts[1]))
        push!(data_dict["Name"], parts[2])
        push!(data_dict["Date"], Dates.Date(parts[3], "d/m/yyyy"))
        push!(data_dict["Grade"], parts[4])
        push!(data_dict["Price"], parse(Int, parts[5]))
    end

    # Convert the dictionary into a DataFrame
    df = DataFrame(data_dict)

    return df
end

# Sample text
text = """
1 │ MARYANNA   14/09/2008  A         79700
2 │ ASHELY     5/08/2008   E         24311
3 │ KHADIJAH   2/09/2008   missing   38904
4 │ TANJA      1/12/2008   C         47052
"""

# Convert text to a DataFrame
df = text_to_dataframe(text)

# Display the DataFrame
println(df)


using CSV, DataFrames
using StringLiterals: @s_str

function text_to_dataframe(text)
    # Split the text into lines
    lines = split(text, "\n")

    # Initialize an empty dictionary to store column data
    data_dict = Dict{String, Any}()

    # Initialize column names
    column_names = []
    for (i, line) in enumerate(lines)
        if i == 1
            column_names = [strip(col) for col in split(line, "│")]
            continue
        end

        parts = split(line, ' ')
        row_data = []

        for (j, part) in enumerate(parts)
            # Convert date strings to Date type
            if column_names[j] == "Date"
                push!(row_data, Dates.Date(part, "d/m/yyyy"))
            else
                push!(row_data, part)
            end
        end

        # Populate the data dictionary with the row data
        for (col, value) in zip(column_names, row_data)
            if col in keys(data_dict)
                push!(data_dict[col], value)
            else
                data_dict[col] = [value]
            end
        end
    end

    # Convert the dictionary into a DataFrame
    df = DataFrame(data_dict)

    return df
end

function main()
    # Sample text
    text = @s_str """
    Row │ Name       Date        Grade     Price
         │ MARYANNA   14/09/2008  A         79700
         │ ASHELY     5/08/2008   E         24311
         │ KHADIJAH   2/09/2008   missing   38904
         │ TANJA      1/12/2008   C         47052
"""

    # Convert text to a DataFrame
    df = text_to_dataframe(text)

    # Display the DataFrame
    println(df)
end