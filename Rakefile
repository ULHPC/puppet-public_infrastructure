#
# Rakefile - Configuration file for rake (http://rake.rubyforge.org/)
#
require 'falkorlib'

## placeholder for custom configuration of FalkorLib.config.*
## See https://github.com/Falkor/falkorlib

# Adapt the versioning aspects
FalkorLib.config.versioning do |c|
	c[:type] = 'puppet_module'
end

# Adapt the Git flow aspects
FalkorLib.config.gitflow do |c|
	c[:branches] = { 
		:master  => 'production',
		:develop => 'devel'
	} 
end

 
require 'falkorlib/tasks/git'
require 'falkorlib/tasks/puppet'

##############################################################################
TOP_SRCDIR = File.expand_path(File.join(File.dirname(__FILE__), "."))

#.....................
namespace :librarian do
	###########   puppet   ###########
	desc "puppet Invoke librarian puppet to initiate a local copy of the used modules"
	task :puppet do |t|
		info "#{t.comment}"
		run %{ librarian-puppet install }
	end # task puppet 
end # namespace librarian


task :setup => 'librarian:puppet'
