# -*- coding: utf-8 -*-

require_relative 'spec_helper'

describe 'jenv::default' do
  let(:chef_run) { ChefSpec::ServerRunner.new.converge(described_recipe) }

  it 'does includes recipes' do
    expect(chef_run).to include_recipe('apt')
  end

  it 'should create group jenv' do
    expect(chef_run).to create_group('jenv').with(
      members: []
    )
  end

  it 'should create user' do
    expect(chef_run).to create_user('jenv').with(
      shell: '/bin/bash',
      group: 'jenv',
      supports: { manage_home: true },
      home: '/home/jenv'
    )
  end

  it 'should create jenv directory' do
    expect(chef_run).to create_directory('/opt/jenv').with(
      owner: 'jenv',
      group: 'jenv',
      mode: '0755',
      recursive: true
    )
  end

  it 'should clone jenv repository' do
    expect(chef_run).to sync_git('/opt/jenv').with(
      user: 'jenv',
      group: 'jenv',
      repository: 'https://github.com/gcuisinier/jenv.git',
      reference: 'master'
    )
  end

  it 'should create template jenv.sh' do
    expect(chef_run).to create_template('/etc/profile.d/jenv.sh').with(
      owner: 'root',
      mode: '0755'
    )
  end
end
