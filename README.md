#GShrimpton.com Website

Website with automated deployment. Uses, and therefore requires, [Terraform](https://www.terraform.io/).

## Bootstrap

The project uses an S3 backend to store the terraform state. To create the bucket required for this, execute:

```bash
./bootstap.sh
```

Requires [awscli](https://aws.amazon.com/cli/) to be installed.

AWS Profile can be set using the environment variable `AWS_DEFAULT_PROFILE`.

## Initialising

```bash
AWS_ACCESS_KEY_ID=<your_access_key_id> AWS_SECRET_ACCESS_KEY=<your-access-key> terraform init
```

## Deploy to AWS

```bash
AWS_ACCESS_KEY_ID=<your_access_key_id> AWS_SECRET_ACCESS_KEY=<your-access-key> terraform apply
```
