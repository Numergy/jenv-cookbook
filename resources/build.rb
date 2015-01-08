# -*- coding: utf-8 -*-
#
# Cookbook Name:: jenv
# Resource:: java
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

actions :install, :run
default_action :install

attribute :name, kind_of: String
attribute :version, kind_of: String
attribute :url, kind_of: String
attribute :checksum, kind_of: String
attribute :symlink, kind_of: String
attribute :global, kind_of: [TrueClass, FalseClass], default: false
attribute :environment, kind_of: Hash, default: {}

def initialize(*args)
  super
  @action = :install
end
