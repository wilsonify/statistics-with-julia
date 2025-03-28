"""
Demo Python code
"""
from textblob import TextBlob


def get_sentiment(string):
    blob = TextBlob(string)
    sentiments = [i.sentiment for i in blob.sentences]
    return sentiments


def test_sent():
    text = """
    Some people think that Star Wars The Last Jedi is an excellent movie,
    with perfect, flawless storytelling and impeccable acting. Others
    think that it was an average movie, with a simple storyline and basic
    acting. However, the reality is almost everyone felt anger and
    disappointment with its forced acting and bad storytelling.
    """
    result = get_sentiment(text)
    assert result == ""
