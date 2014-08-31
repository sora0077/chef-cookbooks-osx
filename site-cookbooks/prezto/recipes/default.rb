#
# Cookbook Name:: prezto
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "zsh"
include_recipe "git"

git "#{node[:user][:home]}/.zprezto" do
    repository "https://github.com/sorin-ionescu/prezto.git"
    reference "master"
    enable_submodules true
    user "#{node[:user][:name]}"
    group "#{node[:user][:group]}"
    action :sync
end


template "#{node[:user][:home]}/.zpreztorc" do
    source "zpreztorc.erb"
    owner "#{node[:user][:name]}"
    group "#{node[:user][:group]}"
    mode "0644"
end

%w{ zshenv zlogin zlogout zprofile }.each do |zfile|
    link "#{node[:user][:home]}/.#{zfile}" do
        to "#{node[:user][:home]}/.zprezto/runcoms/#{zfile}"
        user "#{node[:user][:name]}"
        group "#{node[:user][:group]}"
        not_if { ::File.exists?("#{node[:user][:home]}/.#{zfile}") }
    end
end
