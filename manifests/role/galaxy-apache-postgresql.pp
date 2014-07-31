# == Class: galaxy_roles_profiles::role::galaxy-apache-postgresql
#
# This role create one instance Galaxy runs with apache and postgresql.
#
# === Example
#
# include galaxy_roles_profiles::role::galaxy-apache-postgresql
#
# === Authors
#
# S. Bridel <sbridel@versailles.inra.fr>
# O. Inizan <oinizan@versailles.inra.fr>
#
# === Copyrighti
#
# Copyright 2014, unless otherwise noted.
#
class galaxy_roles_profiles::role::galaxy-apache-postgresql{
  class { 'galaxy_roles_profiles::profile::common':
  }->
  class { 'galaxy_roles_profiles::profile::pgsql':
  }->
  class { 'galaxy_roles_profiles::profile::apache':
  }->
  class { 'galaxy_roles_profiles::profile::galaxy':
  }
}
