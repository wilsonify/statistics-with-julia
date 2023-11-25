using HTTP, JSON

function fetch_and_process_shakespeare_text(url)
    response = HTTP.request("GET", url)
    shakespeare = String(response.body)
    shakespeareWords = split(shakespeare)
    return shakespeareWords
end

function fetch_and_parse_json_data(url)
    response = HTTP.request("GET", url)
    parsedJsonDict = JSON.parse(String(response.body))
    return parsedJsonDict
end

function count_keywords_in_text(keywords, text)
    wordCount = Dict([(x, count(w -> lowercase(w) == lowercase(x), text)) for x in keywords])
    return wordCount
end

function get_top_keywords(wordCount, numToShow)
    sortedWordCount = sort(collect(wordCount), by = last, rev = true)
    return sortedWordCount[1:numToShow]
end

function main()
    shakespeareWords = fetch_and_process_shakespeare_text("https://ocw.mit.edu/ans7870/6/6.006/s08/lecturenotes/files/t8.shakespeare.txt")
    parsedJsonDict = fetch_and_parse_json_data("https://raw.githubusercontent.com/h-Klok/StatsWithJuliaBook/master/data/jsonCode.json")

    keywords = Array{String}(parsedJsonDict["words"])
    numberToShow = parsedJsonDict["numToShow"]
    wordCount = count_keywords_in_text(keywords, shakespeareWords)

    topKeywords = get_top_keywords(wordCount, numberToShow)
    @show topKeywords
end
