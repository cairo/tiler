# tiler

[![CircleCI](https://circleci.com/gh/cairo/tiler.svg?style=svg)](https://circleci.com/gh/cairo/tiler)

An offline service that generates tiles and uploads them to S3.

## Usage

### Preparing the raw input files

Tiler requires raw data-sets that it converts into a pyramid of tiles in XYZ
format. Some of these datasets are large files, which will never change. In
order to speed up build times and to reduce load on public servers, these
large, static inputs are also hosted on S3.

To upload these static, unprocessed files, run:

```bash
AWS_ENDPOINT_URL="https://us-west-1.s3.amazonaws.com" \
    OUTPUT_BUCKET_NAME="gg.statesman.staging.tiles" \
    ./raw-tiles-to-s3
```

### Preparing the tiles

CircleCI uploads built Docker images for this project to ECR whenever you push
to `master`. Update the tiler task definition in Terraform, and then manually
run that task -- this process is not automated, because it should only need to
be run infrequently.
