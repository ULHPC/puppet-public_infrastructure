-*- mode: markdown; mode: auto-fill; fill-column: 80 -*-

# Public_infrastructure Puppet Module 

[![Puppet Forge](http://img.shields.io/puppetforge/v/ulhpc/public_infrastructure.svg)]()
[![License](http://img.shields.io/:license-apache2.0-blue.svg)](LICENSE)
![Supported Platforms](http://img.shields.io/badge/platform-debian-lightgrey.svg)

Public Puppet profiles to be used in r10k environments

      Copyright (c) 2014 S. Varrette, H. Cartiaux, V. Plugaru <hpc-sysadmins@uni.lu>
      

* [Online Project Page](https://github.com/ULHPC/puppet-public_infrastructure)  -- [Sources](https://github.com/ULHPC/puppet-public_infrastructure) -- [Issues](https://github.com/ULHPC/puppet-public_infrastructure/issues)

## Synopsis

Public Puppet profiles to be used in r10k environments
This module implements the following elements: 

* __classes__:     `public_infrastructure`
* __definitions__: 
  * `public_infrastructure::mydef`: 
 
The various operations of this repository are piloted from a `Rakefile` which
assumes that you have [RVM](https://rvm.io/) installed on your system.

## Dependencies

See [`metadata.json`](metadata.json). In particular, this module depends on 

* [puppetlabs/stdlib](https://forge.puppetlabs.com/puppetlabs/stdlib)
* [saz/motd](https://forge.puppetlabs.com/saz/motd)
* [saz/ssh](https://forge.puppetlabs.com/saz/ssh)
* [puppetlabs/ntp](https://forge.puppetlabs.com/puppetlabs/ntp)

## General Parameters

See [manifests/params.pp](manifests/params.pp)

## Overview and Usage

### class `public_infrastructure`

     include ' public_infrastructure'

### definition `public_infrastructure::mydef`

The definition `public_infrastructure::mydef` provides ...
This definition accepts the following parameters:

* `$ensure`: default to 'present', can be 'absent'
* `$content`: specify the contents of the directive as a string
* `$source`: copy a file as the content of the directive.

Example:

      public_infrastructure::mydef {'entry':
           content => "entry\n",
      }

## Librarian-Puppet / R10K Setup

You can of course configure ULHPC-sudo in your `Puppetfile` to make it 
available with [Librarian puppet](http://librarian-puppet.com/) or
[r10k](https://github.com/adrienthebo/r10k) by adding the following entry:

     # Modules from the Puppet Forge
     mod "ulhpc-public_infrastructure"

or, if you prefer to work on the git version: 

     mod "ulhpc-public_infrastructure", 
         :git => https://github.com/ULHPC/puppet-public_infrastructure,
         :ref => production 

## Issues / Feature request

You can submit bug / issues / feature request using the 
[ulhpc-public_infrastructure Puppet Module Tracker](https://github.com/ULHPC/puppet-public_infrastructure/issues). 


## Developments / Contributing to the code 

If you want to contribute to the code, you shall be aware of the way this module
is organized.
These elements are detailed on [`doc/contributing.md`](doc/contributing.md)

You are more than welcome to contribute to its development by 
[sending a pull request](https://help.github.com/articles/using-pull-requests). 

## Tests on Vagrant box

The best way to test this module in a non-intrusive way is to rely on
[Vagrant](http://www.vagrantup.com/). The `Vagrantfile` at the root of the
repository pilot the provisioning of the vagrant box and relies on boxes
generated through my [vagrant-vms](https://github.com/falkor/vagrant-vms)
repository.  
Once cloned, run 

      $> rake packer:Debian:init
      
To create a template. Select the version matching the once mentioned on the
`Vagrantfile` (`7.6.0-amd64` for instance)
Then run 

      $> rake packer:Debian:build
      
This shall generate the vagrant box `debian-7.6.0-amd64.box` that you can then
add to your box lists: 

      $> vagrant box add debian-7.6.0-amd64  packer/debian-7.6.0-amd64/debian-7.6.0-amd64.box

Now you can run `vagrant up` from this repository to boot the VM, provision it
to be ready to test this module (see the [`.vagrant_init.rb`](.vagrant_init.rb)
script). For instance, you can test the manifests of the `tests/` directory
within the VM: 

      $> vagrant ssh 
      [...]
      (vagrant)$> sudo puppet apply -t /vagrant/tests/init.pp
      
Run `vagrant halt` (or `vagrant destroy`) to stop (or kill) the VM once you've
finished to play with it. 

## Resources

### Git 

You should become familiar (if not yet) with Git. Consider these resources: 

* [Git book](http://book.git-scm.com/index.html)
* [Github:help](http://help.github.com/mac-set-up-git/)
* [Git reference](http://gitref.org/)

### r10k, Roles and Profiles

* [r10k reference](https://github.com/adrienthebo/r10k) --
  [Puppetfiles](https://github.com/adrienthebo/r10k/blob/master/doc/puppetfile.mkd)
  and
  [dynamic environment deployment](https://github.com/adrienthebo/r10k/blob/master/doc/dynamic-environments.mkd)
  documentations
* a [Puppet Tutorial](https://github.com/rnelson0/puppet-tutorial) bootstrapping
  a similar configuration, including
  [profiles](https://github.com/rnelson0/rnelson0-profile) and
  [roles](https://github.com/rnelson0/rnelson0-role) -- see
  [Puppet for Vsphere admins](http://rnelson0.com/puppet-for-vsphere-admins/)
* __r10k tutorials__:
  * [Gary Larizza blog](http://garylarizza.com/blog/2014/02/18/puppet-workflow-part-3/),  
  * [Hunner](https://github.com/hunner/roles_and_profiles)
