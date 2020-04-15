# py-lambda-action

[![GitHubActions](https://img.shields.io/badge/listed%20on-GitHubActions-blue.svg)](https://github-actions.netlify.com/py-lambda)

A Github Action to build AWS Lambda functions written in Python with their dependencies in a separate layer. For now, only works with Python 3.6. PRs welcome.

## Use
Produces a zip file suitable for deploying to AWS Lambda.
Works well with AWS CDK, Terraform etc.

### Pre-requisites
In order for the Action to have access to the code, you must use the `actions/checkout@master` job before it. See the example below.

### Structure
- Lambda code should be structured normally/as Lambda would expect it.
- **Dependencies must be stored in a `requirements.txt`** or a similar file (provide the filename explicitly if that's the case).

### Inputs
- `code_dir`
    The path to your python code. Defaults to `.`. Dependencies will be installed inside a dir called `python`.
- `out_file`
    The file path to use for the resulting zip. Defaults to `./lambda.zip`.
- `requirements_txt`
    The name/path for the `requirements.txt` file. Defaults to `requirements.txt`.

### Example workflow
```yaml
name: deploy-py-lambda
on:
  push:
    branches:
      - master
jobs:
  build:
    runs-on: ubuntu-latest
    
    steps:
    - uses: actions/checkout@master
    - name: Deploy code to Lambda
      uses: cmsd2/py-lambda-action@v1.0.0
```
