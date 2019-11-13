# # # # # Twitter API Libraries # # # #
from tweepy.streaming import StreamListener
from tweepy import OAuthHandler
from tweepy import Stream

# # # # # KAFKA Libraries # # # #
from kafka import KafkaProducer

import os


class TStreamer:
    """
    Class for streaming and processing live tweets.
    """
    def __init__(self):
        pass

    def stream_tweets(self, hash_tag_list):
        # This handles Twitter authetification and the connection to Twitter Streaming API
        listener = Listener()
        auth = OAuthHandler(CONSUMER_KEY, CONSUMER_SECRET)
        auth.set_access_token(ACCESS_TOKEN, ACCESS_TOKEN_SECRET)
        stream = Stream(auth, listener)

        # This line filter Twitter Streams to capture data by the keywords:
        stream.filter(track=hash_tag_list)


class Listener(StreamListener):
    """
    This is a basic listener that just prints received tweets to stdout.
    """
    def __init__(self):
        self.topic = 'topic_one'
        self.k_producer = KafkaProducer(bootstrap_servers=['localhost:9092'],
                                        value_serializer=lambda x: x.encode('utf-8'))

    def on_data(self, data):
        self.k_producer.send(self.topic, value=data)
        print(data)
        return True

    def on_error(self, status):
        print(status)


if __name__ == '__main__':
    CONSUMER_KEY = os.environ['CONSUMER_KEY']
    CONSUMER_SECRET = os.environ['CONSUMER_SECRET']
    ACCESS_TOKEN = os.environ['ACCESS_TOKEN']
    ACCESS_TOKEN_SECRET = os.environ['ACCESS_TOKEN_SECRET']

    hash_tag_list = ["cold"]

    t_streamer = TStreamer()
    t_streamer.stream_tweets(hash_tag_list)
