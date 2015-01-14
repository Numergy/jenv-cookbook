# -*- coding: utf-8 -*-
#
# Cookbook Name:: jenv
# Resource:: install
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

actions :run
default_action :run

attribute :version, kind_of: String, name_attribute: true
attribute :root_path, kind_of: String
attribute :user, kind_of: String
attribute :environment, kind_of: Hash

def initialize(*args)
  super
  @action = :run
  @jenv_version = @version
end

def to_s
  "#{super} {#{@user || 'system'}}"
end
