# == Class galaxy_roles_profiles::role::galaxy-apache-sqlite
#
# This role create one instance Galaxy runs with apache and SQLite.
#
# ==== Examples
#
# include galaxy_roles_profiles::role::galaxy-apache-sqlite
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
  class { 'galaxy_roles_profiles::profile::apache':
  }->
  class { 'galaxy_roles_profiles::profile::galaxy':
  }
}
