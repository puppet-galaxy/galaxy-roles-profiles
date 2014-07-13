# == Class galaxy_roles_profiles::profile::apache
# Managing Apache for Galaxy in loadbalancing mode:
# -Install apache and all mods wich are needed
# -Manage apache's configuration
#
# === Parameters
# [*galaxy_roles_profiles::profile::apache::port*]
# Set the port wich you want to use for your Galaxy
# ==== Examples
#
# include galaxy_roles_profiles::profile::apache
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
class galaxy_roles_profiles::profile::apache(){
  include ::apache
  include apache::mod::proxy
  include apache::mod::proxy_balancer
  include apache::mod::rewrite
  include galaxy_roles_profiles::balancer_config

  apache::vhost{ 'galaxy.test':
    port     => hiera('galaxy_roles_profiles::profile::apache::port'),
    docroot  => '/var/www/galaxy',
    rewrites =>
    [
      {
        comment      => 'Rules for Galaxy in loadbalancing mode',
        rewrite_rule => [ '^/static/style/(.*) /home/galaxy/galaxy-dist/static/june_2007_style/blue/$1 [L]',
                          '^/static/scripts/(.*) /home/galaxy/galaxy-dist/static/scripts/packed/$1 [L]',
                          '^/static/(.*) /home/galaxy/galaxy-dist/static/$1 [L]',
                          '^/favicon.ico /home/galaxy/galaxy-dist/static/favicon.ico [L]',
                          '^/robots.txt /home/galaxy/galaxy-dist/static/robots.txt [L]',
                          '^(.*) balancer://galaxy$1 [P]',
                        ]
      },
    ]
  }
}
