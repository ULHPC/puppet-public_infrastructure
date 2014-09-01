-*- mode: markdown; mode: auto-fill; fill-column: 80 -*-

# Profiles Puppet Module 

[![Puppet Forge](http://img.shields.io/puppetforge/v/ulhpc/profiles.svg)](https://forge.puppetlabs.com//ulhpc/profiles)
[![License](http://img.shields.io/:license-apache2.0-blue.svg)](LICENSE)
![Supported Platforms](http://img.shields.io/badge/platform-debian-lightgrey.svg)

Public Puppet profiles to be used in r10k environments

      Copyright (c) 2014 S. Varrette, H. Cartiaux, V. Plugaru <hpc-sysadmins@uni.lu>
      

* [Online Project Page](https://github.com/ULHPC/puppet-profiles)  -- [Sources](https://github.com/ULHPC/puppet-profiles) -- [Issues](https://github.com/ULHPC/puppet-profiles/issues)

## Synopsis

Public Puppet profiles to be used in r10k environments
The various operations of this repository are piloted from a `Rakefile` which
assumes that you have [RVM](https://rvm.io/) installed on your system.

## Dependencies

See `metadata.json`.

## profiles class parameters

* `$ensure` [Default: 'present']: Ensure ulhpc-profiles is present, absent etc. 

## Usage

### class profiles

     include 'profiles'


## Documentation

Please refer to the header of each manifest files to understand the usage of
classes and definitions associated to the 'ulhpc-profiles' module.
 
Alternatively, generate automatically the documentation via
[`puppet doc`](http://docs.puppetlabs.com/man/doc.html) as follows:  

       $> rake doc   # Not yet implemented
       
For other information, please refer to the `metadata.json` file in this directory 

## Librarian-Puppet / R10K Setup

You can of course configure ulhpc-profiles in your `Puppetfile` to make it 
available with [Librarian puppet](http://librarian-puppet.com/) or
[r10k](https://github.com/adrienthebo/r10k) by adding the following entry:

     mod ulhpc-profiles, 
         :git => https://github.com/ULHPC/puppet-profiles,
         :ref => production 


## Issues / Feature request

You can submit bug / issues / feature request using the 
[ulhpc-profiles Tracker](https://github.com/ULHPC/puppet-profiles/issues). 


## Developments / Contributing to the code 

If you want to contribute to the code, you shall be aware of the way this module
is organized.
These elements are detailed on [`doc/contributing.md`](doc/contributing.md)

You are more than welcome to contribute to its development by 
[sending a pull request](https://help.github.com/articles/using-pull-requests). 

## Resources

### Git 

You should become familiar (if not yet) with Git. Consider these resources: 

* [Git book](http://book.git-scm.com/index.html)
* [Github:help](http://help.github.com/mac-set-up-git/)
* [Git reference](http://gitref.org/)

