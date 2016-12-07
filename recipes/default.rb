#
# Cookbook Name:: magus
# Recipe:: default
#
# Copyright 2016 Eagle Genomics Ltd
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

include_recipe 'apt'
include_recipe 'build-essential'
include_recipe 'r'
include_recipe 'Samtools'
include_recipe 'sga'
include_recipe 'perlbrew'

perlbrew_cpanm 'even more ensembl webcode perl modules' do
  # perlbrew node['perlbrew']['perl_version']
  perlbrew 'perl-5.18.2'
  modules ['Getopt::Long', 'FileHandle', 'Moose', 'Switch']
end

remote_file "#{Chef::Config[:file_cache_path]}/#{node['magus']['filename']}" do
  source node['magus']['url']
  action :create_if_missing
end

execute 'unzip magus' do
  command "unzip #{Chef::Config[:file_cache_path]}/#{node['magus']['filename']} -d #{node['magus']['install_path']}"
  not_if { ::File.exist?(node['magus']['dir']) }
end

# remote_file "#{Chef::Config[:file_cache_path]}/#{node['magus']['dataset_filename']}" do
#   source node['magus']['dataset_url']
#   action :create_if_missing
# end

# execute 'un-tar magus dataset' do
#   command "tar xzf #{Chef::Config[:file_cache_path]}/#{node['magus']['dataset_filename']} -C #{node['magus']['dir']}/"
#   not_if { ::File.exist?("#{node['magus']['dir']}/Arabido_data/") }
# end

# this symlinks every executable in the install subdirectory to the top of the directory tree
# so that they are in the PATH
execute "find #{node['magus']['dir']}/magus-1.0/bin/ -maxdepth 1 -name '*' -executable -exec ln -s {} . \\;" do
  cwd 'usr/local/bin'
end

magic_shell_environment 'PERL5LIB' do
  value "#{node['magus']['dir']}/magus-1.0/lib/:$PERL5LIB"
end

# the 'getseq' script relies on perl being present at /usr/local/bin/perl which is not always the case
link '/usr/local/bin/perl' do
  to '/usr/bin/perl'
end
