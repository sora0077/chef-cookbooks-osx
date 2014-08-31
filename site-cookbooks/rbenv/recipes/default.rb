#
# Cookbook Name:: rbenv
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "rc.d"
include_recipe "git"

git "#{node[:user][:home]}/.rbenv" do
    repository "https://github.com/sstephenson/rbenv.git"
    reference "master"
    user "#{node[:user][:name]}"
    group "#{node[:user][:group]}"
    action :sync
end

git "#{node[:user][:home]}/.rbenv/plugins/ruby-build" do
    repository "https://github.com/sstephenson/ruby-build.git"
    reference "master"
    user "#{node[:user][:name]}"
    group "#{node[:user][:group]}"
    action :sync
end

template "#{node[:user][:home]}/.rc.d/rbenv.sh" do
    source "rbenv.sh.erb"
    owner "#{node[:user][:name]}"
    group "#{node[:user][:group]}"
    mode "0644"
    variables(
        :rbenv_root => "$HOME/.rbenv"
    )
end
