# == Class galaxy_roles_profiles::role::galaxy-apache
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
class galaxy_roles_profiles::role::galaxy-apache-sqlite{
  class { 'galaxy_roles_profiles::profile::common':
  }->
  class { 'galaxy_roles_profiles::profile::sqlite':
  }->
  class { 'galaxy_roles_profiles::profile::webapp':
  }
}
