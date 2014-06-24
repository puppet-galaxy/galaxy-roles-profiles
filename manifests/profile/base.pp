# == Class: galaxy_roles_profiles::profile::base
#
# This class manage basic operations for profile construction.
#
# === Parameters
#
# Parameters set by Hiera:
# [*galaxy_roles_profiles::profile::create_user*]
# If enabled allows a new galaxy user creation.
#
# [*galaxy_roles_profiles::profile::home_directory*]
# The full path where the home directory's user will be written.
#
# [*galaxy_roles_profiles::profile::app_directory*]
# The full path where the galaxy repository will be load.
#
# [*galaxy_roles_profiles::profile::galaxy_branch*]
# Which branch of galaxy's development to pull from. Options are "stable" and
# "default", where default is the primary branch for development work.
#
# === Examples
#
#   if hiera('galaxy_roles_profiles::profile::common::core') == 'one'{
#    class{ 'galaxy_roles_profiles::profile::base':
#   }-> ...
#
# === Authors
#
# O. Inizan <oinizan@versailles.inra.fr>
# Eric Rasche <rasche.eric@yandex.ru>
# S. Bridel <sbridel@versailles.inra.fr>
# === Copyright
#
# Copyright 2014, unless otherwise noted.
#
class galaxy_roles_profiles::profile::base(){
  class { 'galaxy':
    create_user => hiera('galaxy_roles_profiles::profile::create_user'),
    directory   => hiera('galaxy_roles_profiles::profile::home_directory'),
  } ->
  galaxy::install{ 'base':
    directory     => hiera('galaxy_roles_profiles::profile::app_directory'),
    galaxy_branch => hiera('galaxy_roles_profiles::profile::galaxy_branch'),
  } ->
  galaxy::first_run{ 'base':
    directory   => hiera('galaxy_roles_profiles::profile::app_directory'),
  }
}
