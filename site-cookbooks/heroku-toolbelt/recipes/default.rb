#
# Cookbook Name:: heroku-toolbelt
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#


bash "install heroku toolbelt" do
    code <<-EOH
        wget -qO- https://toolbelt.heroku.com/install.sh | sh
    EOH
    action :run
    not_if 'which heroku'
end
