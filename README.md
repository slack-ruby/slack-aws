SlackAws
========

[![Build Status](https://api.travis-ci.org/slack-ruby/slack-aws.png)](https://travis-ci.org/slack-ruby/slack-aws)

Slack bot for AWS.

## Installation

See [DEPLOYMENT](DEPLOYMENT.md).

## Commands

### aws

Shows bot version and links.

### aws hi

Politely says 'hi' back.

### aws help

Get help.

### aws s3

* `aws s3 buckets`: Lists S3 buckets.
* `aws s3 ls [bucket] [N]`: Displays max N objects in an S3 bucket.

### aws opsworks

* `aws opsworks stacks`: Lists OpsWorks stacks.
* `aws opsworks apps [stack]`: Lists apps for a given stack.
* `aws opsworks instances [stack]`: Lists instances for a given stack.

## Contributing

See [CONTRIBUTING](CONTRIBUTING.md).

## Copyright and License

Copyright (c) 2015, Daniel Doubrovkine, Artsy and [Contributors](CHANGELOG.md).

This project is licensed under the [MIT License](LICENSE.md).
