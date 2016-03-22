#!/bin/bash

# TODO: list buckets and backup all of them

mkdir -p /data/latest/s3
echo "Starting aws s3 sync for bucket ${AWS_S3_BUCKET}"
aws s3 sync "s3://${AWS_S3_BUCKET}" "/data/latest/s3/${AWS_S3_BUCKET}"
echo "Completed aws s3 sync"