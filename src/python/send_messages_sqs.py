#! /usr/bin/python3

import argparse
import boto3
import faker
import logging
import sys

from botocore.exceptions import ClientError
from time import perf_counter, sleep

logging.basicConfig()
log = logging.getLogger("Main")
log.setLevel(logging.INFO)

log.info("Starting Program")

if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument("--interval", required=True, default=1, help="Wait time between messages")
    parser.add_argument("--ceiling", required=False, default=1000, help="Stop script after max messages")
    parser.add_argument("--timeout", required=False, default=10, help="Stop script when reaching timeout")
    parser.add_argument("--queue_name", required=True, default=10, help="SQS Queue Name")
    args = parser.parse_args()
    
    fake = faker.Faker()
    sqs = boto3.client("sqs", region_name="us-east-1")
    try:
        queue_url = sqs.get_queue_url(QueueName=args.queue_name)['QueueUrl']
        log.info(f"Queue {args.queue_name} :: {queue_url}")
    except ClientError as e:
        log.error(f"Failed to get url of queue with error {e}")
        sys.exit(1)
    
    start = perf_counter()
    i = 0
    while ((perf_counter() - start) < args.timeout) and (i < args.ceiling):
        # create a message
        message = fake.sentence(nb_words=10)
        # send message
        resp = sqs.send_message(
            QueueUrl = queue_url,
            MessageBody = message
        )
        log.info(f"Message sent: {resp['MessageId']} ::> {message}")
        i += 1
        # wait
        sleep(float(args.interval))

    log.info("Ending Program")