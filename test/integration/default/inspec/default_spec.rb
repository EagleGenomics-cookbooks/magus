
# Check that the installation directory was created successfully
describe file('/usr/local/MaGuS-master') do
  it { should be_directory }
end

# run over supplied test data set
# describe command('. /etc/profile; cd /usr/local/MaGuS-master; magus all -w Arabido_data/tagsWgp.out -t Arabido_data/mapped_tag.bam -b Arabido_data/mp_map1_2.bam,5414,1000,76 -b Arabido_data/mp_map2_2.bam,5414,1000,76 -f Arabido_data/Arabido.fa -p Arabido -e 119667750') do
#   its('exit_status') { should eq 0 }
# end

# describe file('/usr/local/MaGuS-master/Arabido_final_scaffolds.fa') do
#   it { should exist }
#  its('content') { should match(/>scaffold-0 423173/) }
# end
