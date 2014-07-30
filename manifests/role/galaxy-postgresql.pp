# == Class galaxy-roles-profiles::role::galaxy-postgresql
#
# This role create one instance of galaxy with posgtresql.
#
# === Example
#
# include galaxy-roles-profiles::role::galaxy-postgresql
#
# === Authors
#
# O. Inizan <oinizan@versailles.inra.fr>
# S. Bridel <sbridel@versailles.inra.fr>
# M. Loaec <mloaec@versailles.inra.fr>
#
# === Copyright
#
# Copyright 2014, unless otherwise noted.
class galaxy_roles_profiles::role::galaxy-postgresql{
  class { 'galaxy_roles_profiles::profile::common':
  }->
  class { 'galaxy_roles_profiles::profile::pgsql':
  }->
  class { 'galaxy_roles_profiles::profile::galaxy':
  }
}
