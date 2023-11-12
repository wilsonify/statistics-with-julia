using PyCall

# Import the TextBlob class from the textblob module
TB = pyimport("textblob")

str = """
Some people think that Star Wars The Last Jedi is an excellent movie,
with perfect, flawless storytelling and impeccable acting. Others
think that it was an average movie, with a simple storyline and basic
acting. However, the reality is almost everyone felt anger and
disappointment with its forced acting and bad storytelling.
"""

# Create a TextBlob object from the input string
blob = TB.TextBlob(str)

# Extract sentiments for each sentence in the TextBlob
sentiments = [i.sentiment for i in blob.sentences]

println(sentiments)


using Test
using PyCall

# Import the TextBlob class from the textblob module
TB = pyimport("textblob")

function analyze_sentiments(text)
    # Create a TextBlob object from the input string
    blob = TB.TextBlob(text)

    # Extract sentiments for each sentence in the TextBlob
    return [i.sentiment for i in blob.sentences]
end

# Define a test for the analyze_sentiments function
@testset "Test analyze_sentiments function" begin
    text = """
    Some people think that Star Wars The Last Jedi is an excellent movie,
    with perfect, flawless storytelling and impeccable acting. Others
    think that it was an average movie, with a simple storyline and basic
    acting. However, the reality is almost everyone felt anger and
    disappointment with its forced acting and bad storytelling.
    """

    sentiments = analyze_sentiments(text)

    @test typeof(sentiments) == Array{Tuple{Float64,Float64},1}
    @test length(sentiments) == 3

    # Add more specific assertions based on expected sentiment values.
    # Example:
    # @test sentiments[1].polarity ≈ 0.85 atol=0.1
    # @test sentiments[2].polarity ≈ 0.0 atol=0.1
    # @test sentiments[3].polarity ≈ -0.75 atol=0.1
end
