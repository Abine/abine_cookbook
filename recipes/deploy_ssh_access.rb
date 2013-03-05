#
# Cookbook Name:: abine
# Recipe:: deploy_ssh_access
#
# Copyright 2013, Abine, Inc.
#
# All rights reserved - Do Not Redistribute
#
rightscale_marker :begin

unless node[:abine][:ssh_keys][:s3_file].empty?
  file "/root/.ssh/deployed_keys" do
    action :delete
  end

  s3_file "/root/.ssh/deployed_keys" do
    source "s3://#{node[:abine][:ssh_keys][:s3_bucket]}/#{node[:abine][:ssh_keys][:s3_file]}"
    access_key_id node[:abine][:ssh_keys][:aws_access_key]
    secret_access_key node[:abine][:ssh_keys][:aws_secret_key]
    owner "root"
    group "root"
    mode '0644'
  end

  bash "remove-old-keys" do
    cwd "/root/.ssh"
    code <<-eos
      head -n1 authorized_keys > root_key
      mv root_key authorized_keys
    eos
  end

  execute "move-in-keys" do
    command "cat deployed_keys >> authorized_keys"
    cwd "/root/.ssh"
  end
end

rightscale_marker :end
