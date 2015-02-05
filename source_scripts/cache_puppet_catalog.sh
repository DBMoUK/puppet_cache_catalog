#!/bin/bash
#
# cache_puppet_catalog.sh
# Author: David Bryant-Moore.
# (c) Puppetlabs 2015.
#
# This script enables puppet catalog caching behaviour by adding the configuration parameter
# use_cached_catalog = true to puppet.conf
#
#
if [[ -f /etc/puppetlabs/puppet/puppet.conf ]]
then
  grep "use_cached_catalog = true" /etc/puppetlabs/puppet/puppet.conf
  if [[ $? -eq 1 ]]
  then 
    echo "use_cached_catalog = true" >> /etc/puppetlabs/puppet/puppet.conf
  else
    echo "Agent node already set to cache catalogs!"
  fi
fi
