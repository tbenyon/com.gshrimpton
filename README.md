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

There are two variables that define how the deployment is performed; `ENV` and `CONF`.

* `ENV`: ***"Where"*** to deploy (e.g. which AWS resrources are created/replaced/deleted as part of this deploy).
* `CONF`: ***"What"*** to deploy (e.g. if prod configuration don't include a robots.txt)

Hence, it would be possible to deploy a prod configuration to a dev environment, if desired, for testing purposes.

```bash
[AWS_PROFILE=profile-name] [ENV=dev|prod] [CONF=dev|prod] ./deploy.sh
```