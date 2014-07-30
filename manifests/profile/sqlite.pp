# == Class: galaxy_roles_profiles::profile::sqlite
#
# This class creates a database with sqlite.
# 
# === Authors
#
# S. Bridel <sbridel@versailles.inra.fr>
# O. Inizan <oinizan@versailles.inra.fr>
# Eric Rasche <rasche.eric@yandex.ru>
# === Copyright
#
# Copyright 2014, unless otherwise noted.
#
class galaxy_roles_profiles::profile::sqlite{
  include galaxy::create_db
}
