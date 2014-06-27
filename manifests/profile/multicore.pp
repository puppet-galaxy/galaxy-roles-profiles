# == Class: galaxy_roles_profiles::profile::multicore
#
# Profile to write one universe_wsgi.ini with 
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
class galaxy_roles_profiles::profile::multicore{
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
    number_of_web_workers        => hiera('galaxy_roles_profiles::number_of_workers'),
    number_of_background_workers => hiera('galaxy_roles_profiles::profile::common::number_of_handlers'),
  }
}  
