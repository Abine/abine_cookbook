#
# Cookbook Name:: abine
# Recipe:: default
#
# Copyright 2012, Abine, Inc.
#
# All rights reserved - Do Not Redistribute
#
rightscale_marker :begin
execute "apt-get-update" do
	command "apt-get update"
	action :nothing
end

execute "Adding NewRelic's key" do
	command "wget -O- http://download.newrelic.com/548C16BF.gpg | apt-key add -"
end

remote_file "/etc/apt/sources.list.d/newrelic.list" do
	source "http://download.newrelic.com/debian/newrelic.list"
	owner "root"
	group "root"
	mode 0640
	notifies :run, "execute[apt-get-update]", :immediately
	action :create_if_missing
end

package "newrelic-sysmond" do
	action :install
end


execute "nrsysmond-config" do
	command "nrsysmond-config --set license_key=#{node[:newrelic][:license_key]}"
	action :run
end

# step 4
service "newrelic-sysmond" do
	supports :restart => true, :status => true
	action [:enable, :start]
end

rightscale_marker :end
