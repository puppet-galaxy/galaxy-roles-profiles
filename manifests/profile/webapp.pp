# == Class: galaxy-roles-profiles::profile::webapp
#
# A profile to build a webapp galaxy server.
# A webapp could run with one server (one core) or could be load balanced on multiple web servers (multi core).
# The webapp profile comes with no special database configuration.
# Jobs scheduling is done locally.
# Main toolshed and test toolshed are refrenced.
# 
# === Parameters
#
# All parameters are setted in hiera files.
#
# [*galaxy-roles-profiles::profile::webapp::core*]
#   Run webapp on one core or on multiple core. Options are "one" or "multi". 
#
# [*galaxy-roles-profiles::profile::webapp::app_directory*]
#   The main directory for galaxy instances that will be installed on this
#   server.
# 
# TODO feature custom toolshed is not tested yet.
# [*galaxy-roles-profiles::profile::webapp::custom_toolsheds*]
#   An array of hashes with keys "url" and "name" for each. These toolsheds
#   will then be available to the user when trying to install software inside
#   of galaxy
#          
# [*galaxy-roles-profiles::profile::webapp::id_secret*]
#    
#
# ==== Examples
#
# include galaxy-roles-profiles::profile::webapp
#
# # === Authors
#
# O. Inizan <oinizan@versailles.inra.fr>
# Eric Rasche <rasche.eric@yandex.ru>

# === Copyright
#
# Copyright 2014, unless otherwise noted.
#
class galaxy-roles-profiles::profile::webapp(){

  if hiera('galaxy-roles-profiles::profile::webapp::core') == 'one'{
    class{ 'galaxy-roles-profiles::profile::base':
    }->
    galaxy::service{'service':
      directory => hiera('galaxy-roles-profiles::profile::webapp::app_directory'),
    }
  }elsif hiera('galaxy-roles-profiles::profile::webapp::core') == 'multi'{
    class{ 'galaxy-roles-profiles::profile::base':
    }->
    galaxy::toolshed_conf{ 'production':
      directory        => hiera('galaxy-roles-profiles::profile::webapp::app_directory'),
      custom_toolsheds => hiera('galaxy-roles-profiles::profile::webapp::custom_toolsheds'),
    } ->
    galaxy::job_conf { 'production':
      directory => hiera('galaxy-roles-profiles::profile::webapp::app_directory'),
    } ->
    galaxy::universe{ 'production':
      directory => hiera('galaxy-roles-profiles::profile::webapp::app_directory'),
      id_secret => hiera('galaxy-roles-profiles::profile::webapp::id_secret'),
      db_config => 'false',
    }
  }
}

