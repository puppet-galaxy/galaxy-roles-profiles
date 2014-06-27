# == Class: galaxy_roles_profiles::profile::first-run-database
#
# Profile to write universe.ini with a postgresql database.
# And make one complete run:
# Start and Stop Galaxy once it has serving one time
# This is needed to migrate the database correctly.
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
class galaxy-roles-profiles::profile:multicore-database{
  $directory=$galaxy::params::directory
  galaxy::universe{ 'production':
      directory                    => hiera('galaxy_roles_profiles::profile::app_directory'),
      id_secret                    => hiera('galaxy_roles_profiles::profile::id_secret'),
      db_config                    => true,
      db_driver                    => hiera('galaxy_roles_profiles::profile::db_driver'),
      db_host                      => hiera('galaxy_roles_profiles::profile::db_host'),
      db_port                      => hiera('galaxy_roles_profiles::profile::db_port'),
      db_opts_pool_size            => hiera('galaxy_roles_profiles::profile:db_opts_pool_size'),
      db_opts_max_overflow         => hiera('galaxy_roles_profiles::profile::db_opts_max_overflow'),
      db_username                  => hiera('galaxy_roles_profiles::profile::db_username'),
      db_password                  => hiera('galaxy_roles_profiles::profile::db_password'),
      db_database                  => hiera('galaxy_roles_profiles::profile::db_database'),
  }->
  exec{'Start Galaxy':
    path => '/usr/bin:/usr/sbin:/bin:/sbin',
    cwd => $directory,
    user => 'galaxy',
    command => "bash run.sh --daemon",
    timeout => 0,
    creates => "$directory/first_run_db_done",
    }->
    exec { 'Finish first run':
      path => '/usr/bin:/usr/sbin:/bin:/sbin',
      onlyif => "test -f $directory/paster.pid",      
      command => "sleep 30 |grep serving $directory/paster.log;",
      tries => 100,
      returns => 0,
    }->
    exec { 'Stop Galaxy':
      path => '/usr/bin:/usr/sbin:/bin:/sbin',
      cwd => $directory,
      user => 'galaxy',
      onlyif => "test -f $directory/paster.pid",
      command => "bash run.sh --stop-daemon",
    }->
    file { "$directory/first_run_done":
      ensure  => present,
      content => ' This file is created once the first run of Galaxy with a database like postgresql is finished.",
    } 
}
