This method LOOKS FOR SECRETS FILE
does not appear to work with tilda use for home dir
dont add a profile

https://github.com/hashicorp/terraform/issues/11268
# should work but doesn't:
shared_credentials_file  = "${pathexpand(~/.aws/terraform-aws-creds}" # Requires recent version of tf to expand ~
