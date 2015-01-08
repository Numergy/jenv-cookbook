# -*- coding: utf-8 -*-
#
# Cookbook Name:: jenv
# Recipe:: default
#
# Copyright 2014, Numergy
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe 'apt'
include_recipe 'git'

group node['jenv']['group'] do
  members node['jenv']['group_users'] if node['jenv']['group_users']
end

user node['jenv']['user'] do
  shell '/bin/bash'
  group node['jenv']['group']
  supports manage_home: node['jenv']['manage_home']
  home node['jenv']['user_home']
end

directory node['jenv']['root_path'] do
  owner node['jenv']['user']
  group node['jenv']['group']
  mode '0755'
  recursive true
end

git node['jenv']['root_path'] do
  user node['jenv']['user']
  group node['jenv']['group']
  repository node['jenv']['git_repository']
  reference node['jenv']['git_reference']
  action :sync
end

template '/etc/profile.d/jenv.sh' do
  source 'jenv.sh.erb'
  owner 'root'
  mode '0755'
  only_if do
    node['jenv']['create_profiled']
  end
end
