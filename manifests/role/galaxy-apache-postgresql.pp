# == Class: galaxy_roles_profiles::role::galaxy-apache-postgresql
#
# A role to build a multicore web server plugged on a
# postgresql database.
#
# === Authors
#
# S. Bridel <sbridel@versailles.inra.fr>
# O. Inizan <oinizan@versailles.inra.fr>
#
# === Copyright
#
# Copyright 2014, unless otherwise noted.
#
class galaxy_roles_profiles::role::galaxy-apache-postgresql{
  class { 'galaxy_roles_profiles::profile::common':
  }->
  class { 'galaxy_roles_profiles::profile::pgsql':
    db_name => hiera('galaxy_roles_profiles::profile::db_database'),
    db_user => hiera('galaxy_roles_profiles::profile::db_username'),
    db_pass => hiera('galaxy_roles_profiles::profile::db_password'),
  }->
  class { 'galaxy_roles_profiles::profile::apache':
  }->
  class { 'galaxy_roles_profiles::profile::galaxy':
  }
}
