# == Class galaxy-roles-profiles::profile::webapp
# Managing Apache for Galaxy in loadbalancing mode:
# -Install apache and all mods wich are needed
# -Manage apache's configuration
#
# === Parameters
# [*galaxy-roles-profiles::profile::webapp::port*]
# Set the port wich you want to use for your Galaxy
# ==== Examples
#
# include galaxy-roles-profiles::profile::webapp
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
class galaxy-roles-profiles::profile::webapp(){
  include apache
  include apache::proxy
  include apache::mod::proxy_balancer
  include apache::mod::rewrite
  include galaxy-roles-profiles::balancer_config

  apache::vhost{ 'galaxy.test':
    port     => hiera('galaxy-roles-profiles::profile::webapp::port'),
    docroot  => '/var/www/galaxy',
    rewrites =>[
      {
          comment      =>'Rules for Galaxy in loadbalancing mode',
          rewrite_rule =>'^/static/style/(.*) /home/galaxy/galaxy-dist/static/june_2007_style/blue/$1 [L]
  RewriteRule ^/static/scripts/(.*) /home/galaxy/galaxy-dist/static/scripts/packed/$1 [L]
  RewriteRule ^/static/(.*) /home/galaxy/galaxy-dist/static/$1 [L]
  RewriteRule ^/favicon.ico /home/galaxy/galaxy-dist/static/favicon.ico [L]
  RewriteRule ^/robots.txt /home/galaxy/galaxy-dist/static/robots.txt [L]
  RewriteRule ^(.*) balancer://galaxy$1 [P]',
      },
    ]
  }
}
