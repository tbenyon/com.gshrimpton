# GShrimpton.com Website
### (...or, the most sophisticated deployment of a single static page website ever)

Website with automated deployment. Uses, and therefore requires, [Terraform](https://www.terraform.io/).

## Bootstrap

The project uses an S3 backend to store the terraform state. To create the bucket required for this, execute:

```bash
[AWS_PROFILE=profile-name] ./bootstap.sh
```

Requires [awscli](https://aws.amazon.com/cli/) to be installed.

AWS profile can be set using `AWS_PROFILE` environment variable.

## Initialising

```bash
AWS_ACCESS_KEY_ID=<your_access_key_id> AWS_SECRET_ACCESS_KEY=<your-access-key> terraform init
```

## Deploy to AWS

AWS profile can be set using `AWS_PROFILE` environment variable.

Deploy environment can be specified using the `STAGE` environment variable. Available values are:

* dev
* prod

```bash
[AWS_PROFILE=profile-name] [STAGE=dev|prod] ./deploy.sh
```