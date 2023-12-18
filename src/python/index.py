import boto3
import json
import uuid
import logging

# Define a logging system
LOGGER = logging.getLogger()
LOGGER.setLevel(logging.INFO)

def handler(event, context):
    print(json.dumps(event))
    return {
        "statusCode": 200
    }