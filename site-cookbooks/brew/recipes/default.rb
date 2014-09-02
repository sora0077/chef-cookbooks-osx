#
# Cookbook Name:: brew
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
include_recipe 'homebrew'

homebrew_tap 'homebrew/binary'

node.homebrew.packages.each do |pkg|
    package pkg
end

package "caskroom/cask/brew-cask" do
    action :install
end

node.homebrew_cask.packages.each do |pkg|
    homebrew_cask pkg
end
