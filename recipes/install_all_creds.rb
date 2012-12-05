#
# Cookbook Name:: abine
# Recipe:: install_all_creds
#
# Copyright 2012, Abine, Inc.
#
# All rights reserved - Do Not Redistribute
#
rightscale_marker :begin

abine_creds 'install creds' do
  action :deploy
end

rightscale_marker :end
