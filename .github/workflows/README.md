# GitHub Actions Workflows Setup

## Terraform Plan Workflow

Workflow: [terraform-plan.yml](./terraform-plan.yml)

Add below secrets in GitHub Repository Secrets:

- AWS_ACCOUNT_ID (the AWS account ID is used in s3 bucket name, use S3_TF_BUCKET_NAME if you want to use a custom name)
- AWS_REGION (for OIDC authentication)
- ROLE_TO_ASSUME (for OIDC authentication)

Workflow Description:
- Triggered on push on `main` branch, `develop` branch, and pull request events on `main` branch
- Validate Terraform code
- Plan Terraform changes
- Add plan summary to GitHub pull request
