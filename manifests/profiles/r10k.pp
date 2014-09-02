# File::      <tt>r10k.pp</tt>
# Author::    S. Varrette, H. Cartiaux, V. Plugaru <hpc-sysadmins@uni.lu>
# Copyright:: Copyright (c) 2014 S. Varrette, H. Cartiaux, V. Plugaru
# License::   Apache-2.0
#
# ------------------------------------------------------------------------------
# = Profile: profile::r10k
#
# Base profile
#
# === Parameters
#
# None
#
# === Variables
#
# None
#
# === Examples
#
#  include profile::base
#
# == Warnings
#
# /!\ Always respect the style guide available
# here[http://docs.puppetlabs.com/guides/style_guide]
#
# Puppet roles and profiles:
# * http://puppetlabs.com/presentations/designing-puppet-rolesprofiles-pattern
#
# [Remember: No empty lines between comments and class definition]
#
class profile::r10k inherits profile {

    # TODO: from hiera...
    $puppet_env_dir = '/etc/puppet/environments'
    
    # TODO: manage /etc/puppet/environments directory

    class { 'r10k':
        version           => '2.2.8',
        sources           => {
            'puppet' => {
                'remote'  => 'https://github.com/ULHPC/puppet-public_infrastructure.git',
                'basedir' => "${::settings::confdir}/environments",
                'prefix'  => false,
            }
        },
        purgedirs         => ["${::settings::confdir}/environments"],
        manage_modulepath => true,
        modulepath        => "${::settings::confdir}/environments/\$environment/modules:/opt/puppet/share/puppet/modules",
    }

    ini_setting { 'manifestdir':
        ensure  => 'present',
        path    => '/etc/puppet/puppet.conf',
        section => 'main',
        setting => 'manifestdir',
        value   => '/etc/puppet/environments/$environment/manifests',
    }
    
    
}
