# puppet_cache_catalog
Enable / Revert Puppet Catalog Caching For Puppet Enterprise v.3.7.0+

In the event of PuppetDB becoming unavailable, Puppet Enterprise agents
will fail to apply catalogs because agent facts can't be submitted back
to PuppetDB.

The solution is to instruct Puppet Agents to use their last known good
catalog.  This is achieved through setting the configuration parameter
use_cached_catalog = true in puppet.conf.

However, if catalogs can't be successfully applied to Puppet Agents
then this configuration setting can't be rolled out via a Puppet Class.

puppet_cache_catalog.1.0-0.i686.rpm in conjunction with MCollective
uses a bash script: cache_puppet_catalog.sh to enable the setting on 
RPM installation, and revert_puppet_catalog_caching.sh on RPM removal
.

Instructions for use:

Deploy the RPM to your internal package repository, so that it's 
available to your Agent nodes from yum.

As the peadmin user on your Puppet Master node, issue the following
command to install the RPM on your agent nodes, adding the appropriate
suffix options to control filtering, and rollout of the package,
as described at:

https://docs.puppetlabs.com/mcollective/reference/basic/basic_cli_usage.html#discovering-available-agents
https://docs.puppetlabs.com/mcollective/reference/basic/basic_cli_usage.html#selecting-request-targets-using-filters


mco package install puppet_cache_catalog-1.0-0.i686.rpm <FILTERING OPTIONS>

The package will automatically update /etc/puppetlabs/puppet/puppet.conf

Subsequent Puppet Agent runs will then utilise the last known good
catalogue on the nodes on which the package has been installed.

Once PuppetDB becomes available, you can revert the change to 
puppet.conf by simply uninstalling the package.


This package has been tested against CentOS 6.5 x64, and
Puppet Enterprise 3.7.0.

 
