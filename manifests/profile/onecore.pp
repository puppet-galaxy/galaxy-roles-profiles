# == Class: galaxy_roles_profiles::profile::onecore
#
# Profile to write configuration files for onecore
# And start Galaxy as a service.
#
# === Examples
#
#include galaxy_roles_profiles::profile::onecore
#
# === Auhtors
#
# S.Bridel <sbridel@versailles.inra.fr>
#
# === Copyright
#
# Copyright 2014, unless otherwise noted.
#
class galaxy_roles_profiles::profile::onecore {
  galaxy::universe{ 'production':
    directory     => hiera('galaxy_roles_profiles::profile::app_directory'),
    id_secret     => hiera('galaxy_roles_profiles::profile::id_secret'),
    require_login => false,
  }->
  galaxy::service{ 'service':
    directory => hiera('galaxy_roles_profiles::profile::app_directory'),
  }
}
