#
# Cookbook Name:: rc.d
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

directory "#{node[:user][:home]}/.rc.d" do
    user "#{node[:user][:name]}"
    group "#{node[:user][:group]}"
    action :create
end
