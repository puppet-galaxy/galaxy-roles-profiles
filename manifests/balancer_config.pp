# == Class: galaxy-roles-profiles::balancer-config
#
# This class write the file balancer_galaxy.conf with all the balancer members.
#
# === Parameters
#
# [*$webworker_starting_port_number*]: port for the first web worker
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
  $webworker_starting_port_number= 8000,
)
{ 
  case $::osfamily{
    'RedHat':  { $directory = '/etc/httpd/conf.d'}
    'Debian': { $directory = '/etc/apache2/conf.d'}
  }
  $number_of_web_workers_array = range('0', -1+$galaxy::universe::number_of_web_workers)
  file { "$directory/balancer_galaxy.conf":
    content => template('galaxy_roles_profiles/balancer_galaxy.conf.erb'),
  }
}
