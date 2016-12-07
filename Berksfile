source 'https://supermarket.chef.io'

def company_cookbook(name, version = '>= 0.0.0', options = {})
  cookbook(name, version, { git: "git@github.com:EagleGenomics-cookbooks/#{name}.git" }.merge(options))
end

company_cookbook 'Samtools'
company_cookbook 'sga'

cookbook 'r', git: 'https://github.com/stevendanna/cookbook-r.git'
cookbook 'magic_shell', '~> 1.0.0'

# cookbooks found on supermarket
metadata
