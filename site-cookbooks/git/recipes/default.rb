#
# Cookbook Name:: git
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package "git" do
    action :install
end

template "#{node[:user][:home]}/.gitconfig" do
    source "gitconfig.erb"
    owner "#{node[:user][:name]}"
    group "#{node[:user][:group]}"
    mode "0644"
    variables({
        :user_name => node[:user][:name],
        :user_email => node[:user][:email]
    })
end
