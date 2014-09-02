#
# Cookbook Name:: pyenv
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "rc.d"


package "pyenv" do
    action :install
end

package "pyenv-virtualenv" do
    action :install
end

template "#{node[:user][:home]}/.rc.d/pyenv.sh" do
    source "pyenv.sh.erb"
    owner "#{node[:user][:name]}"
    group "#{node[:user][:group]}"
    mode "0644"
end
