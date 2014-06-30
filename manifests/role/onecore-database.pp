# == Class: galaxy_roles_profiles::role::onecore-database
#
# A role to manage database migration if 
# the database is not SQLite
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
class galaxy_roles_profiles::role::onecore-database(){
  class { 'galaxy_roles_profiles::profile::base':
  }-> 
  class { 'galaxy_roles_profiles::profile::onecore-database':
  }->
  class { 'galaxy_roles_profiles::profile::database':
  }
}
