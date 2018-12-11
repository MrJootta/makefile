# Makefile Guideline

This is a base Makefile for lambda codes, it perform the basics operations

## Dependencies

- upx
- serverless cli

## Commands

**Usage:**  `make <command>`

- dep
- build
- run
- clean
- deploy

## Descriptions

#### dep
Runs dep ensure with verbose

#### build
Runs go build with optimized flags and upx for binary size reduction

#### run
Deploy the lambda and run a json file against it

#### clean
Removes vendor files and .lock file

#### deploy
Performs `clean` `dep` `build` and deploy to AWS
