# == Class galaxy_roles_profiles::role::multicore
# This role create one instance of galaxy with multicore configuration.
# That means Galaxy runs with several cores and with SQLite.
#
# ==== Examples
#
# include galaxy_roles_profiles::role::multicore
#
# === Authors
#
# O. Inizan <oinizan@versailles.inra.fr>
# S. Bridel <sbridel@versailles.inra.fr>
#
# === Copyright
#
# Copyright 2014, unless otherwise noted.
#
class galaxy_roles_profiles::role::multicore(){
  class { 'galaxy_roles_profiles::profile::base':
  }->
  class { 'galaxy_roles_profiles::profile::multicore':
  }->
  class { 'galaxy_roles_profiles::profile::webapp':
  }
}
