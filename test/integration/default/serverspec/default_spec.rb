# -*- coding: utf-8 -*-

require 'spec_helper'

describe service('ssh') do
  it { should be_enabled }
  it { should be_running }
end

describe group 'jenv' do
  it { should exist }
end

describe user 'jenv' do
  it { should exist }
  it { should belong_to_group 'jenv' }
  it { should have_home_directory '/home/jenv' }
  it { should have_login_shell '/bin/bash' }
end

describe file '/home/jenv' do
  it { should be_directory }
  it { should be_owned_by 'jenv' }
  it { should be_grouped_into 'jenv' }
end

describe file '/opt/jenv' do
  it { should be_directory }
  it { should be_owned_by 'jenv' }
  it { should be_grouped_into 'jenv' }
  it { should be_mode 755 }
end

%w(shims plugins versions).each do |dir|
  describe file "/opt/jenv/#{dir}" do
    it { should be_directory }
    it { should be_owned_by 'jenv' }
    it { should be_grouped_into 'jenv' }
    it { should be_mode 755 }
  end
end

describe file '/opt/jenv/versions/1.6' do
  it { should be_directory }
  it { should be_owned_by 'jenv' }
  it { should be_grouped_into 'jenv' }
end

describe file '/opt/jenv/versions/1.7' do
  it { should be_directory }
  it { should be_owned_by 'jenv' }
  it { should be_grouped_into 'jenv' }
end

describe file '/opt/jenv/version' do
  its(:content) { should match(/1.6/) }
  it { should be_owned_by 'jenv' }
  it { should be_grouped_into 'jenv' }
  it { should be_mode 644 }
end

describe file '/opt/jenv/plugins/maven' do
  it { should be_symlink }
end

describe file '/opt/jenv/plugins/groovy' do
  it { should_not be_file }
  it { should_not be_directory }
  it { should_not be_symlink }
end
