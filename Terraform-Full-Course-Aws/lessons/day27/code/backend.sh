# Create bucket for Terraform state
aws s3 mb s3://staging-my-terraform-bucket-smoke1 --region eu-west-2

# Enable versioning for state history
aws s3api put-bucket-versioning \
  --bucket staging-my-terraform-bucket-smoke1 \
  --versioning-configuration Status=Enabled

# Enable encryption
aws s3api put-bucket-encryption \
  --bucket staging-my-terraform-bucket-smoke1 \
  --server-side-encryption-configuration '{
    "Rules": [{
      "ApplyServerSideEncryptionByDefault": {
        "SSEAlgorithm": "AES256"
      }
    }]
  }'