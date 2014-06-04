# == Class: galaxy-roles-profiles::role::multicore-database
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
class galaxy-roles-profiles::role::multicore-database(){
  class{ 'galaxy-role-profiles::profile::common':
    config => 'mutlicore_database',
  }
  class{ 'galaxy-role-profiles::profile::webapp': }
  class{ 'galaxy-role-profiles::profile::database': }
}
