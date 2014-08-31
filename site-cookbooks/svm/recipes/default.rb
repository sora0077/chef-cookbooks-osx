#
# Cookbook Name:: svm
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "rc.d"
include_recipe "git"

git "#{node[:user][:home]}/.svm" do
    repository "https://github.com/yuroyoro/svm.git"
    reference "master"
    user "#{node[:user][:name]}"
    group "#{node[:user][:group]}"
    action :sync
end

template "#{node[:user][:home]}/.rc.d/svm.sh" do
    source "svm.sh.erb"
    owner "#{node[:user][:name]}"
    group "#{node[:user][:group]}"
    mode "0644"
end
