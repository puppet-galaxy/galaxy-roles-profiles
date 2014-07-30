# == Class galaxy_roles_profiles::profile::galaxy
#
# This class calls galaxy::service to start galaxy as a service.
#
# ==== Examples
#
# include galaxy_roles_profiles::profile::galaxy
#
# === Authors
#
# S. Bridel <sbridel@versailles.inra.fr>
# O. Inizan <oinizan@versailles.inra.fr>
# M. Loac   <mloac@versailles.inra.fr>
#
# === Copyright
#
# Copyright 2014, unless otherwise noted.
#
class galaxy_roles_profiles::profile::galaxy{
  include galaxy::service
}
