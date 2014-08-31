#
# Cookbook Name:: powerline
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#


package "fontforge" do
    action :install
end

directory "#{node[:user][:tmp]}" do
    user "#{node[:user][:name]}"
    group "#{node[:user][:group]}"
    action :create
end

git "#{node[:user][:tmp]}/vim-powerline" do
    repository "https://github.com/Lokaltog/vim-powerline.git"
    reference "master"
    user "#{node[:user][:name]}"
    group "#{node[:user][:group]}"
    action :sync
end

bash "fontforge -script" do
    code <<-EOH
        fontforge -script #{node[:user][:tmp]}/vim-powerline/fontpatcher/fontpatcher  ~/Library/Fonts/<使うfont>
        sudo sh -c "echo '/usr/local/bin/zsh' >> /etc/shells"
        chsh -s /usr/local/bin/zsh #{node[:user][:name]}
    EOH
    not_if 'test "/usr/local/bin/zsh" = "$(grep /usr/local/bin/zsh /etc/shells)"'
end
