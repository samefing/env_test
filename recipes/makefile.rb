serviceaccount = data_bag_item( 'serviceaccounts', 'sv_tripwire' )


directory 'c:\temp' do
	action :create
end

file 'c:\temp\test.txt' do
	content	"This server belongs to #{node['env_domain']}"
end

file 'C:\temp\architecture.txt' do
	content node['kernel']['os_info']['os_architecture']
end

install_path = 'c:\blah'

if node.chef_environment == 'pre-production'
	install_path = 'C:\temp\install'
elsif node.chef_environment == 'development'
	install_path = 'D:\temp\install'
end

file 'C:\temp\test2.txt' do
	content "#{install_path}"
end

file 'environment_password' do
	path  'c:\temp\environmentpassword.txt'
	content serviceaccount[node.chef_environment]['password']
	action :create
end

file '/tmp/something do
  owner 'root'
  group 'root'
  mode 00755
  action :create
end
