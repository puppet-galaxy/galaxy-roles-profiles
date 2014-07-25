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
class galaxy_roles_profiles::profile::apache(
  $port_to_listen = 8081
){
  include ::apache
  include apache::mod::rewrite
  apache::mod{ 'uwsgi': }
  if $galaxy::universe::wk_config{
    apache::vhost{ 'galaxy':
      port     => $port_to_listen,
      docroot  => '/var/www/galaxy',
      rewrites =>
      [
        {
          comment      => 'Rules for Galaxy in uWSGI mode',
          rewrite_rule => [ '^/static/style/(.*) /home/galaxy/galaxy-dist/static/june_2007_style/blue/$1 [L]',
                            '^/static/scripts/(.*) /home/galaxy/galaxy-dist/static/scripts/packed/$1 [L]',
                            '^/static/(.*) /home/galaxy/galaxy-dist/static/$1 [L]',
                            '^/favicon.ico /home/galaxy/galaxy-dist/static/favicon.ico [L]',
                            '^/robots.txt /home/galaxy/galaxy-dist/static/robots.txt [L]',
                          ]
       },
      ],
      custom_fragment => '
<Location />
  Sethandler uwsgi-handler
  uWSGISocket 127.0.0.1:4001
  uWSGImaxVars 512
</Location>
      '
    }
  }

  else{
    apache::vhost{ 'galaxy':
      port     => $port_to_listen,
      docroot  => '/var/www/galaxy',
      rewrites =>
      [
        {
          comment      => 'Rules for Galaxy in loadbalancing mode',
          rewrite_rule => '^(.*) http://localhost:8080$1 [P]',
        },
      ]
    }
  }
}
