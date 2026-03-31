# Setup GitHub Actions Workflows

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
- Add plan output and analysis result to GitHub summary for easy review
- Upload plan artifact when changes are detected
- Set job outputs for downstream workflows

## Terraform Apply Workflow

Workflow: [terraform-apply.yml](./terraform-apply.yml)

Prerequisites:
- Same secrets as terraform-plan workflow
- Environment protection rules configured for `production` environment (recommended)

Workflow Description:
- Triggered automatically after terraform-plan workflow completes successfully
- Only executes when terraform plan detects changes (exit code 2)
- Supports environment approval process for production deployments
- Downloads plan artifact from previous workflow run
- Executes terraform apply with the approved plan
- Provides detailed apply results in GitHub summary
- Includes comprehensive error handling and status reporting

### Environment Protection (Recommended)

Configure environment protection rules for the `production` environment in GitHub:
1. Go to Settings → Environments → New environment
2. Name: `production`
3. Configure protection rules:
   - Required reviewers (recommended: 1-2 people)
   - Deployment protection rules
   - Environment secrets (if needed)

This ensures terraform apply requires manual approval before executing changes.
