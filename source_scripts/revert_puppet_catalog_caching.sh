#!/bin/bash
#
# revert_puppet_catalog_caching.sh
# Author: David Bryant-Moore.
# (c) Puppetlabs 2015.
#
# This script reverts puppet catalog caching behaviour by removing the configuration parameter
# use_cached_catalog = true from puppet.conf, if present
#
#
if [[ -f /etc/puppetlabs/puppet/puppet.conf ]]
then
  grep "use_cached_catalog = true" /etc/puppetlabs/puppet/puppet.conf >/dev/null
  if [[ $? -eq 0 ]]
  then 
    sed -e s/"use_cached_catalog = true"/""/ /etc/puppetlabs/puppet/puppet.conf > /etc/puppetlabs/puppet/puppet.conf.new
    if [[ -f /etc/puppetlabs/puppet/puppet.conf.new ]]
    then
      grep 'use_cached_catalog = true' /etc/puppetlabs/puppet/puppet.conf.new >/dev/null
      if [[ $? -eq 1 ]]
      then
        mv -f /etc/puppetlabs/puppet/puppet.conf.new /etc/puppetlabs/puppet/puppet.conf
      fi
    fi
  else
    echo "Agent node not set to cache catalogs!"
  fi
fi
