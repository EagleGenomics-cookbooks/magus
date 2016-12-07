default['magus']['install_path'] = '/usr/local'
default['magus']['dir'] = "#{node['magus']['install_path']}/MaGuS-master"
default['magus']['filename'] = 'master.zip'
default['magus']['root_url'] = 'https://github.com/institut-de-genomique/MaGuS/archive/'
default['magus']['url'] = "#{node['magus']['root_url']}#{node['magus']['filename']}"
default['magus']['dataset_root_url'] = 'http://www.genoscope.cns.fr/magus/datasets/MaGuS/Arabido/'
default['magus']['dataset_filename'] = 'Arabido_data.tar.gz'
default['magus']['dataset_url'] = "#{node['magus']['dataset_root_url']}#{node['magus']['dataset_filename']}"
