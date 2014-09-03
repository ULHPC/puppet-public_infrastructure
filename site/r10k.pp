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

