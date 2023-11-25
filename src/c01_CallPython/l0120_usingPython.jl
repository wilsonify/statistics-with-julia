using PyCall

function analyze_sentiments(str)
    # NLP via Python's TextBlob
    TB = pyimport("textblob")
    # Create a TextBlob object from the input string
    blob = TB.TextBlob(str)
    # Extract sentiments for each sentence in the TextBlob
    sentiments = [ i.sentiment for i in blob.sentences ]
    return sentiments
    end

if abspath(PROGRAM_FILE) == @__FILE__
    result = analyze_sentiments("""
        Some people think that Star Wars The Last Jedi is an excellent movie,
        with perfect, flawless storytelling and impeccable acting. Others
        think that it was an average movie, with a simple storyline and basic
        acting. However, the reality is almost everyone felt anger and
        disappointment with its forced acting and bad storytelling.
    """
    )
    println(result)
end