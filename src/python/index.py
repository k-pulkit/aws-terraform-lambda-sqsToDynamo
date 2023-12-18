import boto3
import json
import time
import logging
import os

from datetime import datetime

# Define a logging system
logging.basicConfig()
LOGGER = logging.getLogger()
LOGGER.setLevel(logging.INFO)

def handler(event, context):
    print(json.dumps(event))
    
    table_name = os.environ.get("table_name", "dynamodb")
    dynamo = boto3.resource("dynamodb")
    table = dynamo.Table(table_name)
    LOGGER.info(table.table_status)
    
    records = event["Records"]
    responses = []
    
    for record in records:
        try:
            response = table.put_item(Item= {
                'messageid': record["messageId"],
                'message': record["body"],
                'timestamp': datetime.now().isoformat()
                })
            responses.append(response)
            LOGGER.info(f"Processed message {record['messageId']}")
        except Exception as e:
            print(e)
    
    LOGGER.info(json.dumps(responses, default=str))
    
    return {
        "statusCode": 200 if len(responses)>0 else 400,
        "body": responses
    }