# == Class galaxy-roles-profiles::role::multicore
# This role create one instance of galaxy with multicore configuration.
# That means Galaxy runs with several cores and with SQLite.
#
# ==== Examples
#
# include galaxy-roles-profiles::role::multicore
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
class galaxy-roles-profiles::role::multicore(){
  class { 'galaxy-roles-profiles::profile::common':
    config => 'multicore',
  }->
  class {'galaxy-roles-profiles::profile::webapp':
  }
}
