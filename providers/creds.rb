#
# Cookbook Name:: abine
#
# Copyright 2012, Abine, Inc.
#
# All rights reserved - Do Not Redistribute
#
action :deploy do
  log "Clearing old credentials and downloading new ones..."
  directory node[:abine][:credentials][:credential_location] do
    action :delete
    recursive true
  end

  directory node[:abine][:credentials][:credential_location] do
    action :create
    recursive true
    mode '0755'
  end

  #fetch the s3 file
  s3_file "#{node[:abine][:credentials][:credential_location]}/download.tar.gz" do
    source "s3://#{node[:abine][:credentials][:s3_bucket]}/#{node[:abine][:credentials][:s3_file]}"
    access_key_id node[:abine][:credentials][:aws_access_key]
    secret_access_key node[:abine][:credentials][:aws_secret_key]
    owner "root"
    group "root"
    mode '0644'
  end

  #untar it
  execute "tar -xf download.tar.gz" do
    cwd node[:abine][:credentials][:credential_location]
  end
end
