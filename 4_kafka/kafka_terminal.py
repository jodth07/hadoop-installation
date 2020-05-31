from time import sleep
from json import dumps
from kafka import KafkaProducer
from datetime import datetime


producer = KafkaProducer(bootstrap_servers=['localhost:9092'],
                         value_serializer=lambda x: dumps(x).encode('utf-8'))

if __name__ == '__main__':

    for e in range(1000):
        data = {
            "time": datetime.now(),
            "data_type": "Sample",
            'value': f"the current number is {e}"
        }
        producer.send('topic_one', value=data)
        sleep(2)
