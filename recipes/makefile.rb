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