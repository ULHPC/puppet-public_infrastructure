#!/bin/sh
# Bootstrapping r10k and librarian-puppet
#
# Credits:
# * [purple52](https://github.com/purple52/librarian-puppet-vagrant/)
# * [garylarizza](http://garylarizza.com/blog/2014/02/18/puppet-workflow-part-3/)
# * [rnelson](http://rnelson0.com/2014/05/19/puppet-and-git-201-r10k-setup-installation/)
#
COLOR_RED="\033[0;31m"
COLOR_BACK="\033[0m"

# Directory in which librarian-puppet should manage its modules directory
PUPPET_DIR=/etc/puppet/
PUPPET_ENV_DIR=${PUPPET_DIR}/environments

# Default setting for packer -- see [vagrant-vms](https://github.com/Falkor/vagrant-vms)
PUPPETFILE_SRC=/tmp/Puppetfile

# Settings inside a vagrant box
if [ -d '/vagrant' ]; then
    [ -f '/vagrant/puppet/Puppetfile' ] && PUPPETFILE_SRC=/vagrant/puppet/Puppetfile
    [ -f '/vagrant/Puppetfile' ]        && PUPPETFILE_SRC=/vagrant/Puppetfile
    [ -f '/vagrant/manifests/install.pp' ] && INSTALL_MANIFEST=/vagrant/manifests/install.pp
fi

info() {
    echo "==> $*"
}
print_error_and_exit() {
    echo -e "${COLOR_RED}*** ERROR *** $*${COLOR_BACK}"
    exit 1
}

[ $UID -gt 0 ] && print_error_and_exit "You must be root to execute this script (current uid: $UID)"

# NB: librarian-puppet might need git installed. If it is not already installed
# in your basebox, this will manually install it at this point using apt or yum

$(which git > /dev/null 2>&1)
FOUND_GIT=$?
$(which apt-get > /dev/null 2>&1)
FOUND_APT=$?
$(which yum > /dev/null 2>&1)
FOUND_YUM=$?

if [ "$FOUND_GIT" -ne '0' ]; then
    echo 'Attempting to install git.'

    if [ "${FOUND_YUM}" -eq '0' ]; then
        yum -q -y makecache
        yum -q -y install git
        echo 'git installed.'
    elif [ "${FOUND_APT}" -eq '0' ]; then
        apt-get -q -y update
        apt-get -q -y install git
        echo 'git installed.'
    else
        echo 'No package installer available. You may need to install git manually.'
    fi
else
    info 'git found.'
fi

if [ ! -d "$PUPPET_DIR" ]; then
    info "creating ${PUPPET_DIR}"
    mkdir -p ${PUPPET_DIR}
fi

[ ! -f ${PUPPETFILE_SRC} ] && print_error_and_exit "unable to find the puppetfile  ${PUPPETFILE_SRC}"

info "copying ${PUPPETFILE_SRC} in ${PUPPET_DIR}"
cp ${PUPPETFILE_SRC} ${PUPPET_DIR}/

# Installing librarian-puppet
if [ "$(gem list -i '^librarian-puppet$')" == "false" ]; then
    info "installing the 'librarian-puppet' gem"
    gem install librarian-puppet
fi

# Installing r10k
info "installing r10k"
puppet module install zack/r10k

if [ ! -d "${PUPPET_ENV_DIR}" ]; then
    mkdir -p ${PUPPET_ENV_DIR}
fi

[ -z "${INSTALL_MANIFEST}" ] && print_error_and_exit "unable to find the installer manifest"

info "Configuring r10k by puppet apply"
puppet apply ${INSTALL_MANIFEST}


[ "${FOUND_YUM}" -eq "0" ] && yum reinstall rubygems -y
[ "${FOUND_APT}" -eq "0" ] && apt-get install --reinstall -y rubygems

info "deploying r10k"
r10k deploy environment -pv
