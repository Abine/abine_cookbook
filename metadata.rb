maintainer       "Abine, Inc."
maintainer_email "cloud@abine.com"
license          "All rights reserved"
description      "Installs/Configures Abine"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.0.1"

recipe "abine::install_all_creds", "Install a TAR of all the credentials"

attribute "abine/credentials/s3_file",
  :display_name => "Abine Credential Remote File Name",
  :description => "The name of the credential file as it exists in an Amazon S3 bucket.",
  :required => "recommended",
  :recipes => ["abine::install_all_creds"]

attribute "abine/credentials/aws_access_key",
  :display_name => "Amazon Access Key that can read this file",
  :description => "AWS credentials that have read access to the file that you specified.",
  :required => "recommended",
  :recipes => ["abine::install_all_creds"]

attribute "abine/credentials/aws_secret_key",
  :display_name => "Amazon Secret Access Key that can read this file",
  :description => "AWS credentials that have read access to the file that you specified.",
  :required => "recommended",
  :recipes => ["abine::install_all_creds"]

attribute "abine/credentials/credential_location",
  :display_name => "Local Path for Credential Files",
  :description => "Local Directory where credential files should live. Leave out trailing slash",
  :required => "optional",
  :default => "/etc/php5/creds",
  :recipes => ["abine::install_all_creds"]

attribute "abine/credentials/s3_bucket",
  :display_name => "Amazon S3 bucket",
  :description => "Name of S3 bucket where the credentials are stored.",
  :required => "recommended",
  :recipes => ["abine::install_all_creds"]

attribute "abine/credentials/enable",
  :display_name => "Deploy credentials from S^3",
  :description => "Retrieves database credentials from an S^3 bucket into a specified path.",
  :required => "recommended",
  :choice => ["true", "false"],
  :default => "false"
