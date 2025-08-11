#!/bin/sh
cd ..
aws s3 sync . s3://adgu-datasets/
