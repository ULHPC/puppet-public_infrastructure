# File::      <tt>init.pp</tt>
# Author::    S. Varrette, H. Cartiaux, V. Plugaru <hpc-sysadmins@uni.lu>
# Copyright:: Copyright (c) 2014 S. Varrette, H. Cartiaux, V. Plugaru
# License::   Apache-2.0
#
# ------------------------------------------------------------------------------
# = Role: initial role class

class role {
    include profile::base
}
