# == Class galaxy-roles-profiles::role::galaxy-sqlite
#
# This role create one instance of galaxy with sqlite
#
# === Example
#
# include galaxy-roles-profiles::role::galaxy-sqlite
#
# === Authors
#
# O. Inizan <oinizan@versailles.inra.fr>
# S. Bridel <sbridel@versailles.inra.fr>
# M. Loaec <mloaec@versailles.inra.fr>
# === Copyright
#
# Copyright 2014, unless otherwise noted.
class galaxy_roles_profiles::role::galaxy-sqlite{
  class { 'galaxy_roles_profiles::profile::common':
  }->
  class { 'galaxy_roles_profiles::profile::sqlite':
  }->
  class { 'galaxy_roles_profiles::profile::galaxy':
  }
}
