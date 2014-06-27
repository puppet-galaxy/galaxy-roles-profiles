# == Class: galaxy_roles_profiles::profile::multicore-database
#
# Profile to write toolshed_conf,job_conf and universe_wsgi.ini
# to have Galaxy in load-balancing and with a postgresql database.
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

galaxy::toolshed_conf{ 'production':
      directory        => hiera('galaxy_roles_profiles::profile::app_directory'),
      custom_toolsheds => hiera('galaxy_roles_profiles::profile::custom_toolsheds'),
    }->
    galaxy::job_conf { 'production':
      directory => hiera('galaxy_roles_profiles::profile::app_directory'),
    }->
    galaxy::universe{ 'production':
      directory                    => hiera('galaxy_roles_profiles::profile::app_directory'),
      id_secret                    => hiera('galaxy_roles_profiles::profile::id_secret'),
      wk_config                    => true,
      db_config                    => true,
      db_driver                    => hiera('galaxy_roles_profiles::profile::common::db_driver'),
      db_host                      => hiera('galaxy_roles_profiles::profile::common::db_host'),
      db_port                      => hiera('galaxy_roles_profiles::profile::common::db_port'),
      db_opts_pool_size            => hiera('galaxy_roles_profiles::profile::common::db_opts_pool_size'),
      db_opts_max_overflow         => hiera('galaxy_roles_profiles::profile::common::db_opts_max_overflow'),
      db_username                  => hiera('galaxy_roles_profiles::profile::db_username'),
      db_password                  => hiera('galaxy_roles_profiles::profile::db_password'),
      db_database                  => hiera ('galaxy_roles_profiles::profile::db_database'),
      number_of_background_workers => hiera('galaxy_roles_profiles::profile::common::number_of_handlers'),
      number_of_web_workers        => hiera('galaxy_roles_profiles::number_of_workers'),
    }
}
