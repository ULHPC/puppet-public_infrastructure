# File::      <tt>base.pp</tt>
# Author::    S. Varrette, H. Cartiaux, V. Plugaru <hpc-sysadmins@uni.lu>
# Copyright:: Copyright (c) 2014 S. Varrette, H. Cartiaux, V. Plugaru
# License::   Apache-2.0
#
# ------------------------------------------------------------------------------
# = Profile: profile::base
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
class profile::base inherits profile {

    include ::motd

    # SSH server and client
    class { '::ssh::server':
        options => {
            'PermitRootLogin'          => 'yes',
            'Protocol'                 => '2',
            'SyslogFacility'           => 'AUTHPRIV',
            'PasswordAuthentication'   => 'yes',
            'GSSAPIAuthentication'     => 'yes',
            'GSSAPICleanupCredentials' => 'yes',
            'AcceptEnv'                => 'LANG LC_CTYPE LC_NUMERIC LC_TIME LC_COLLATE LC_MONETARY LC_MESSAGES LC_PAPER LC_NAME LC_ADDRESS LC_TELEPHONE LC_MEASUREMENT LC_IDENTIFICATION LC_ALL LANGUAGE XMODIFIERS',
            'Subsystem'                => '      sftp    /usr/libexec/openssh/sftp-server',
            'Banner'                   => '/etc/issue.net',
        },
    }
    class { '::ssh::client':
        options => {
            'Host *' => {
                'SendEnv'                   => 'LANG LC_*',
                'HashKnownHosts'            => 'yes',
                'GSSAPIAuthentication'      => 'yes',
                'GSSAPIDelegateCredentials' => 'no',
            },
        },
    }

    class { '::ntp':
        servers => [ '0.pool.ntp.org', '2.centos.pool.ntp.org', '1.rhel.pool.ntp.org'],
    }
}
