maintainer       "Abine, Inc."
maintainer_email "cloud@abine.com"
license          "All rights reserved"
description      "Installs/Configures Abine"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.0.2"

depends "rightscale"

recipe "abine::install_all_creds", "Install a TAR of all the credentials"
recipe "abine::deploy_ssh_access", "Install SSH keys to the root's authorized key file"

attribute "abine/credentials/s3_file",
  :display_name => "Abine Credential Remote File Name",
  :description => "The name of the database credential file as it exists in an Amazon S3 bucket.",
  :required => "recommended",
  :recipes => ["abine::install_all_creds"]

attribute "abine/credentials/aws_access_key",
  :display_name => "Amazon Access Key that can read this file",
  :description => "AWS credentials that have read access to the database credentials file that you specified.",
  :required => "recommended",
  :recipes => ["abine::install_all_creds"]

attribute "abine/credentials/aws_secret_key",
  :display_name => "Amazon Secret Access Key that can read this file",
  :description => "AWS credentials that have read access to the database credentials file that you specified.",
  :required => "recommended",
  :recipes => ["abine::install_all_creds"]

attribute "abine/credentials/credential_location",
  :display_name => "Local Path for Credential Files",
  :description => "Local Directory where database credential files should live. Leave out trailing slash",
  :required => "optional",
  :default => "/etc/php5/creds",
  :recipes => ["abine::install_all_creds"]

attribute "abine/credentials/s3_bucket",
  :display_name => "Amazon S3 bucket",
  :description => "Name of S3 bucket where the database credentials are stored.",
  :required => "recommended",
  :recipes => ["abine::install_all_creds"]

attribute "abine/credentials/enable",
  :display_name => "Deploy credentials from S^3",
  :description => "Retrieves database credentials from an S^3 bucket into a specified path.",
  :required => "recommended",
  :choice => ["true", "false"],
  :default => "false",
  :recipes => ["abine::install_all_creds"]


attribute "abine/ssh_keys/s3_file",
  :display_name => "Abine SSH keys File Name",
  :description => "The name of the file that has the SSH keys to deploy.",
  :required => "recommended",
  :recipes => ["abine::deploy_ssh_access"]

attribute "abine/ssh_keys/aws_access_key",
  :display_name => "Amazon Access Key that can read the key file",
  :description => "AWS credentials that have read access to the SSH key file that you specified.",
  :required => "recommended",
  :recipes => ["abine::deploy_ssh_access"]

attribute "abine/ssh_keys/aws_secret_key",
  :display_name => "Amazon Secret Access Key that can read the key file",
  :description => "AWS credentials that have read access to the SSH key file that you specified.",
  :required => "recommended",
  :recipes => ["abine::deploy_ssh_access"]

attribute "abine/ssh_keys/s3_bucket",
  :display_name => "Amazon S3 bucket",
  :description => "Name of S3 bucket where the SSH keys are stored.",
  :required => "recommended",
  :default => "abine-ssh-keys",
  :recipes => ["abine::deploy_ssh_access"]
