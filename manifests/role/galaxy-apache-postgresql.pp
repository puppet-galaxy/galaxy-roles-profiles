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
  class { 'galaxy_roles_profiles::profile::database':
  }->
  class { 'galaxy_roles_profiles::profile::webapp':
  }->
  class { 'galaxy_roles_profiles::profile::galaxy_service':
  }
}
