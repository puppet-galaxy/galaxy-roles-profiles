# == Class: galaxy-roles-profiles::balancer-config
#
# This class write the file balancer_galaxy.conf with all the balancer members.
#
# === Parameters
#
# [*$directory*]: where we want to write balancer_galaxy.conf
# [*$webworker_starting_port_number*]: port for the first web worker
#
# Parameters set by Hiera:
#
# [*galaxy-roles-profiles::number_of_workers*]
# Set the number of web workers
#
#==== Examples
#
# include galaxy-roles-profiles::balancer_config
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
class galaxy_roles_profiles::balancer_config(
  $directory = '/etc/apache2/conf.d/',
  $webworker_starting_port_number= 8000,
){
  $number_of_web_workers_array = range('0', -1+hiera('galaxy-roles-profiles::number_of_workers'))
  file { "$directory/balancer_galaxy.conf":
    content => template('galaxy-roles-profiles/balancer_galaxy.conf.erb'),
  }
}
