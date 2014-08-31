#
# Cookbook Name:: install_zsh
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "rc.d"
include_recipe "zsh"
include_recipe "prezto"

file "#{node[:user][:home]}/.zshrc" do
    action :delete
    only_if "test -f #{node[:user][:home]}/.zshrc"
end

link "#{node[:user][:home]}/.zshrc" do
  action :delete
  only_if "test -L #{node[:user][:home]}/.zshrc"
end

template "#{node[:user][:home]}/.zshrc" do
    source "zshrc.erb"
    owner "#{node[:user][:name]}"
    group "#{node[:user][:group]}"
    mode "0644"
end

bash "chsh -s zsh" do
    code <<-EOH
        sudo sh -c "echo '/usr/local/bin/zsh' >> /etc/shells"
        chsh -s /usr/local/bin/zsh #{node[:user][:name]}
    EOH
    not_if 'test "/usr/local/bin/zsh" = "$(grep /usr/local/bin/zsh /etc/shells)"'
end
