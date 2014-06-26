# == Class: galaxy_roles_profiles::profile::common
#
# Common profile to build a galaxy server.
# Used with default configuration this profile build a basic galaxy instance
# (usefull for development)
#
# === Parameters
#
# [*$config*]
# $config allows to choose what configuration you want for your galaxy.
# Options are multicore | multicore_database.
# By default, $config is one core.
#
# Parameters set by Hiera:
# [*galaxy_roles_profiles::number_of_workers*]
# Set the number of web workers.
#
# [*galaxy_roles_profiles::profile::common::number_of_handlers*]
# Set the number of background workers.
#
# [*galaxy_roles_profiles::profile::create_user*]
# If enabled allows a new galaxy user creation.
#
# [*galaxy_roles_profiles::profile::home_directory*]
# The full path where the home directory's user will be written.
#
# [*galaxy_roles_profiles::profile::app_directory*]
# The full path where the galaxy repository will be load.
#
# [*galaxy_roles_profiles::profile::custom_toolsheds*]
# An array of hashes with keys "url" and "name" for each. These toolsheds
# will then be available to the user when trying to install software inside
# of galaxy.
#
# [*galaxy_roles_profiles::profile::id_secret*]
# Galaxy encodes various internal values when these values will be output in
# some format (for example, in a URL or cookie). You should set a key to be
# used by the algorithm that encodes and decodes these values. It can be any
# string. If left unchanged, anyone could construct a cookie that would
# grant them access to others' sessions.
# (Tip: use `openssl rand -hex 32` to generate one)
#
# [*galaxy_roles_profiles::profile::galaxy_branch*]
# Which branch of galaxy's development to pull from. Options are "stable" and
# "default", where default is the primary branch for development work
#
# [*galaxy_roles_profiles::profile::galaxy_branch*]
# Which branch of galaxy's development to pull from. Options are "stable" and
# "default", where default is the primary branch for development work. # [*galaxy_roles_profiles::profile::webapp::core*]
# Run webapp on one core or on multiple core. Options are "one" or "multi".
#
# [*galaxy_roles_profiles::profile::common::db_driver*]
# Database driver to use. Use one of 'postgresql' or 'mysql'. Others have not been tested with this puppet module.
#
# [*galaxy_roles_profiles::profile::db_username*]
# Username to connect to database with. It is recommend you create a separate user for galaxy. We recommend use of the puppetlabs database modules to manage database users.
#
# [*galaxy_roles_profiles::profile::db_password*]
# Password to connect to database with.
#
# [*galaxy_roles_profiles::profile::common::db_host*]
# Host for the database.
#
# [*galaxy_roles_profiles::profile::common::db_port*]
# Port for the database.
#
# [*galaxy_roles_profiles::profile::db_database*]
# Name of the database (schema in postgres, database name in mysql).
#
# [*galaxy_roles_profiles::profile::common::db_opts_pool_size*]
# ???
#
# [*galaxy_roles_profiles::profile::common::db_opts_max_overflow*]
# ???
#
# === Examples
#
# class {'galaxy_roles_profiles::profile::common':
#  $config => 'as_you_want',
# }
#
# === Authors
#
# S. Bridel <sbridel@versailles.inra.fr>
# O. Inizan <oinizan@versailles.inra.fr>
# Eric Rasche <rasche.eric@yandex.ru>
#
# === Copyright
#
# Copyright 2014, unless otherwise noted.
#
class galaxy_roles_profiles::profile::common ($config = 'void'){
  if $config == 'multicore'{
    class{ 'galaxy_roles_profiles::profile::base':
    }->
    galaxy::toolshed_conf{ 'production':
      directory        => hiera('galaxy_roles_profiles::profile::app_directory'),
      custom_toolsheds => hiera('galaxy_roles_profiles::profile::custom_toolsheds'),
    }->
    galaxy::job_conf { 'production':
      directory => hiera('galaxy_roles_profiles::profile::app_directory'),
    }->
    galaxy::universe{ 'production':
      require_login                => false,
      directory                    => hiera('galaxy_roles_profiles::profile::app_directory'),
      id_secret                    => hiera('galaxy_roles_profiles::profile::id_secret'),
      wk_config                    => true,
      number_of_background_workers => hiera('galaxy_roles_profiles::profile::common::number_of_handlers'),
      number_of_web_workers        => hiera('galaxy_roles_profiles::number_of_workers'),
    }
  }
  elsif $config == 'multicore_database'{
    class{ 'galaxy_roles_profiles::profile::base':
    }->
    galaxy::toolshed_conf{ 'production':
      directory        => hiera('galaxy_roles_profiles::profile::app_directory'),
      custom_toolsheds => hiera('galaxy_roles_profiles::profile::custom_toolsheds'),
    }->
    galaxy::job_conf { 'production':
      directory => hiera('galaxy_roles_profiles::profile::app_directory'),
    }->
    galaxy::universe{ 'production':
      require_login                => false,
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
  elsif $config == 'onecore'{
    class { 'galaxy_roles_profiles::profile::base':
    }->
    galaxy::universe{ 'production':
      require_login => false,
      directory     => hiera('galaxy_roles_profiles::profile::app_directory'),
      id_secret     => hiera('galaxy_roles_profiles::profile::id_secret'),
    }-> 
    galaxy::service{ 'service':
      directory => hiera('galaxy_roles_profiles::profile::app_directory'),
    }
  }  
  else {
        err ( "param config is :  $config . config have to be onecore | multicore | multicore_database")
  }
}
