# -*- coding: utf-8 -*-
#
# Cookbook Name:: jenv
# Provider:: plugin
#
# Copyright 2015, Numergy
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

include Chef::Jenv::Mixin

action :enable do
  perform_plugin('enable')
  new_resource.updated_by_last_action(true)
end

action :disable do
  perform_plugin('disable')
  new_resource.updated_by_last_action(true)
end

private

def perform_plugin(method)
  command = "jenv #{method}-plugin #{new_resource.name}"
  jenv_script "#{command} #{which_jenv}" do
    code command
    user new_resource.user if new_resource.user
    root_path new_resource.root_path if new_resource.root_path
    action :nothing
  end.run_action(:run)
end