# == Class: galaxy-roles-profiles::profile::base
#
# This class manage basic operations for Galaxy webapp class.
#
# ==== Examples
#
#   if hiera('galaxy-roles-profiles::profile::webapp::core') == 'one'{
#    class{ 'galaxy-roles-profiles::profile::base':
#   }-> ...
#
# # === Authors
#
# O. Inizan <oinizan@versailles.inra.fr>
#
# === Copyright
#
# Copyright 2014, unless otherwise noted.
#
class galaxy-roles-profiles::profile::base(){
  class { 'galaxy':
    create_user => hiera('galaxy-roles-profiles::profile::webapp::create_user'),
    directory   => hiera('galaxy-roles-profiles::profile::webapp::home_directory'),
  } ->
  galaxy::install{ 'base':
    directory     => hiera('galaxy-roles-profiles::profile::webapp::app_directory'),
    galaxy_branch => hiera('galaxy-roles-profiles::profile::webapp::galaxy_branch'),
  } ->
  galaxy::first_run{ 'base':
    directory   => hiera('galaxy-roles-profiles::profile::webapp::app_directory'),
  }
}
