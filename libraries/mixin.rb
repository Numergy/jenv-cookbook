# -*- coding: utf-8 -*-
#
# Cookbook Name:: jenv
# Library:: mixin_jenv
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

class Chef
  module Jenv
    # Mixin module for Jenv
    module Mixin
      def which_jenv
        "{#{new_resource.user || 'system'}}"
      end

      def jenv_root
        if new_resource.root_path
          new_resource.root_path
        elsif new_resource.user
          ::File.join(user_home, '.jenv')
        else
          node['jenv']['root_path']
        end
      end

      def java_version(version)
        "1.#{version}"
      end

      def current_global_version
        version_file = ::File.join(jenv_root, 'version')
        ::File.exist?(version_file) && ::IO.read(version_file).chomp
      end
    end
  end
end
