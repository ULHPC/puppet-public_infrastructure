# File::      <tt>install.pp</tt>
# Author::    Sebastien Varrette (<Sebastien.Varrette@uni.lu>)
# Copyright:: Copyright (c) 2014 Sebastien Varrette (www[http://varrette.gforge.uni.lu])
# License::   GPLv3
#
# ------------------------------------------------------------------------------
# = install r10k

# TODO: from hiera...
$puppet_env_dir = '/etc/puppet/environments'

# TODO: manage /etc/puppet/environments directory

class { 'r10k':
    version           => '1.3.2',
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
