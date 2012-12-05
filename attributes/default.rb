#
# Cookbook Name:: abine
#
# Copyright 2012, Abine, Inc.
#
# All rights reserved - Do Not Redistribute
#

# Attributes related to credentials
default[:abine][:credentials][:s3_file] = "latest.tar.gz"
default[:abine][:credentials][:aws_access_key] = ""
default[:abine][:credentials][:aws_secret_key] = ""
default[:abine][:credentials][:credential_location] = "/etc/apache2/php5/creds"
default[:abine][:credentials][:s3_bucket] = ""
default[:abine][:credentials][:enable] = 'false'
