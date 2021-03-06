# -*- coding: utf-8 -*-
#
# Cookbook Name:: jenv
# Library:: matchers
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

if defined?(ChefSpec)
  def run_jenv_install(command)
    ChefSpec::Matchers::ResourceMatcher.new(:jenv_install, :run, command)
  end

  def run_jenv_script(command)
    ChefSpec::Matchers::ResourceMatcher.new(:jenv_script, :run, command)
  end

  def create_jenv_global(command)
    ChefSpec::Matchers::ResourceMatcher.new(:jenv_global, :create, command)
  end

  def enable_jenv_plugin(command)
    ChefSpec::Matchers::ResourceMatcher.new(:jenv_plugin, :enable, command)
  end

  def disable_jenv_plugin(command)
    ChefSpec::Matchers::ResourceMatcher.new(:jenv_plugin, :disable, command)
  end
end
