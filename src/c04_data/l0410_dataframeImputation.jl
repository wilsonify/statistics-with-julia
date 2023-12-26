# Cleaning and imputing data

using DataFrames
using CSV
using Statistics
using .IOLibrary: read_purchaseData

function summarize_purchaseData2(data)
    # dropmissing() and by() are used to calculate the mean price of each group,
    # excluding rows with missing values.
    # The results are rounded to the nearest thousand (digits = -3) and stored as the data frame grPr.
    # by function was removed from DataFrames.jl.
    # Use `combine(groupby(), )` or `combine(f, groupby())` instead.
    # grPr = by(dropmissing(data), :Grade, :Price=>x -> AvgPrice = round(mean(x), digits=-3))
    grPr = combine(groupby(dropmissing(data), :Grade), :Price => x -> round(mean(x), digits = -3))
    return grPr
end

function enrich_data_with_summary(data)
    grPr = summarize_purchaseData2(data)
    # the dictionary d is created based on the values from grPr,
    # with grade the key,
    # and average price the value.
    d = Dict(grPr[:,1] .=> grPr[:,2])

    # the nearIndx() function is created.
    # It takes a value as input, x,
    # and then finds the index of the nearest value from a given vector of values, v.

    nearIndx(v, x) = findmin(abs.(v .- x))[2]
    # we loop over each row in the data frame and impute missing values in the price and grade columns.
    for i in 1:nrow(data)
        if ismissing(data[i, :Price]) # if the price entry is missing,
            # then the grade is used to return the corresponding value stored in the dictionary d.
            data[i, :Price] = d[data[i, :Grade]]
        end
        if ismissing(data[i, :Grade]) # if the grade entry is missing,
            # then the nearIndx() function is used to find the index of the closest value
            # in grPr based on the price in data,
            # and then missing is replaced by the corresponding grade.
            data[i, :Grade] = grPr[nearIndx(grPr[:, 2], data[i, :Price]), :Grade]
        end
    end
    return data
end

function keep_complete_grade_and_price(data)
    # we check if there are any rows with missing values in both the :Grade and :Price columns,
    # and we remove them if present.
    # First ismissing() is applied element-wise over all values in each column,
    # .& is then used to evaluate to true if both columns contain missing,
    # and finally the preceding .! is used to ﬂip the result,
    # evaluating to true if the row should be kept.
    # In our example, there are no rows with missing values in both columns, so all rows are kept.
    rowsKeep = .!(ismissing.(data.Grade) .& ismissing.(data.Price))
    data = data[rowsKeep, :]
    return data
    end

function replace_all_missing_names(data)
    # we replace all missing names with the strings "QQ" and "31/06/2008",
    # respectively, via replace!().
    replace!(x -> ismissing(x) ? "QQ" : x, data.Name)

    return data
    end

function replace_all_missing_dates(data)
    # we replace all missing names with the strings "QQ" and "31/06/2008",
    # respectively, via replace!().

    replace!(x -> ismissing(x) ? "30/06/2008" : x, data.Date)
    return data
    end

function main_l0410_dataframeImputation()
    path_to_here = @__DIR__
    path_to_data = abspath("$path_to_here/../../data")
    data = read_purchaseData("$path_to_data/purchaseData.csv")
    data = keep_complete_grade_and_price(data)
    data = replace_all_missing_names(data)
    data = replace_all_missing_dates(data)
    data = enrich_data_with_summary(data)
    # At this point, no missing values are present.
    println(first(data, 5)) # print the first several rows of the data frame
    println(describe(data)) # along with a summary of the cleaned data frame.
end

if abspath(PROGRAM_FILE) == @__FILE__
    main_l0410_dataframeImputation()
end

export keep_complete_grade_and_price
export replace_all_missing_names
export replace_all_missing_dates
export enrich_data_with_summary
