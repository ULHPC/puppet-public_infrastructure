# File::      <tt>site.pp</tt> 
# Author::    Sebastien Varrette (<Sebastien.Varrette@uni.lu>)
# Copyright:: Copyright (c) 2014 Sebastien Varrette (www[http://varrette.gforge.uni.lu])
# License::   Apache-2.0 (see LICENSE)
# 
# ------------------------------------------------------------------------------
# This file is the main entry point used when an agent connects to a master and
# asks for an updated configuration. 
#
# Global objects like filebuckets and resource defaults should go in this file,
# as should the default node definition. (The default node can be omitted
# if you use the console and don't define any other nodes in site.pp. See
# http://docs.puppetlabs.com/guides/language_guide.html#nodes for more on
# node definitions.)
#
# Resource: https://github.com/glarizza/puppet_repository/blob/production/manifests/site.pp
#

## Active Configurations ##
#
# TODO: filebucket settings
#


# DEFAULT NODE
# Node definitions in this file are merged with node data from the console. See
# http://docs.puppetlabs.com/guides/language_guide.html#nodes for more on
# node definitions.

# The default node definition matches any node lacking a more specific node
# definition. If there are no other nodes in this file, classes declared here
# will be included in every node's catalog, *in addition* to any classes
# specified in the console for that node.

node default {
    include role::base   
}
