# -*- coding: utf-8 -*-
#
# Cookbook Name:: jenv
# Attributes:: default
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

default['apt']['compile_time_update'] = true

default['java']['oracle']['accept_oracle_download_terms'] = true

default['jenv']['user']           = 'jenv'
default['jenv']['group']          = 'jenv'
default['jenv']['user_home']      = '/home/jenv'
default['jenv']['manage_home']    = true
default['jenv']['group_users']    = []

default['jenv']['root_path'] = '/opt/jenv'

default['jenv']['create_profiled'] = true
default['jenv']['git_force_update'] = false
default['jenv']['git_repository'] = 'https://github.com/gcuisinier/jenv.git'
default['jenv']['git_reference'] = 'master'

default['jenv']['jdk_versions'] = %w(6 7)
default['jenv']['global_version'] = '7'

default['jenv']['plugins'] = %w(maven)
