# GShrimpton.com Website

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

Deploy environment can be specified using the `ENV` environment variable. Available values are:

* dev
* prod

```bash
[AWS_PROFILE=profile-name] [ENV=dev|prod] ./deploy.sh
```