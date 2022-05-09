#{node['infra_chef']['extension']}# name 'Attribute file for infra_chef'
# maintainer 'Jimbo Dragon'
# maintainer_email 'jimbo_dragon@hotmail.com'
# license 'MIT'
# description 'Attribute file for infra_chef'
# version '0.1.0'
# chef_version '>= 16.6.14'
# issues_url 'https://github.com/jimbodragon/infra_chef/issues'
# source_url 'https://github.com/jimbodragon/infra_chef'

default['infra_chef']['project_name'] = nil
default['infra_chef']['chef_repo_initialized'] = false
default['infra_chef']['chef_generator_initialized'] = false
default['infra_chef']['project_description'] = "Build the chef infrasctructure of #{node['infra_chef']['project_name']}"
default['infra_chef']['chef_repo_name'] = node['infra_chef']['project_name']
default['infra_chef']['environments'] = []
default['infra_chef']['install_dir'] = ::File.join(::Dir.pwd, "chef_repositories")
default['infra_chef']['initial_command'] = "wget https://raw.githubusercontent.com/jimbodragon/initialize_chef_repo/master/initializator.sh && bash initializator.sh #{node['infra_chef']['project_name']} DR SIT QA Test Dev"
default['infra_chef']['chef_solo_command'] = "chef-solo --chef-license 'accept' --json-attributes node.json --config solo.rb --override-runlist \"role[#{node['infra_chef']['project_name']}]\""
default['infra_chef']['cron_chef_solo_command'] = "chef-solo --chef-license 'accept' --config #{::File.join("#{node['infra_chef']['install_dir']}", "solo.rb")} --override-runlist \"role[#{node['infra_chef']['project_name']}]\""
default['infra_chef']['chef_boostrapped'] = false
default['infra_chef']['environment'] = "production"
default['infra_chef']['run_list'] = ["recipe[infra_chef]"]

default['infra_chef']['gitinfo'] = nil

default['infra_chef']['cron'] = {
  "minute": "0,5,10,15,20,25,30,35,40,45,50,55"
}

default['chef-git-server']['compile_time'] = false
# default['chef-git-server']['repositories'] = [ node['infra_chef']['project_name'], "#{node['infra_chef']['project_name']}_generator", "infra_chef", "initialize_chef_repo" ]