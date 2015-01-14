# -*- coding: utf-8 -*-
jenv_install '6'
jenv_global '6'
jenv_install '7'

jenv_plugin 'maven'
jenv_plugin 'groovy'
jenv_plugin 'groovy' do
  action :disable
end
