# == Class: galaxy_roles_profiles::role::multicore-database
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
#
class galaxy_roles_profiles::role::multicore-database(){
  class { 'galaxy_roles_profiles::profile::base':
  }->
  class { 'galaxy_roles_profiles::profile::database':
  }->
  class { 'galaxy_roles_profiles::profile::first-run-database':
  }->
  class { 'galaxy_roles_profiles::profile::multicore-database':
  }->
  class { 'galaxy_roles_profiles::profile::webapp':
  }
}
