#
# Cookbook Name:: brew
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
include_recipe 'homebrew'

node.homebrew.packages.each do |pkg|
    package pkg
end
