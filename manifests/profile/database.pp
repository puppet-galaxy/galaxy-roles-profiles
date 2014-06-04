# == Class: galaxy-roles-profiles::profile::database
#
# Database profile to build one database for PostgreSQL.
# See https://forge.puppetlabs.com/puppetlabs/postgresql/3.3.3 for more information
# === Parameter
# All are sets by Hiera
# [*galaxy-roles-profiles::profile::db_username*]
# Username to connect to database with. It is recommend you create a separate user for galaxy. We recommend use of the puppetlabs database modules to manage database users.
#
# [*galaxy-roles-profiles::profile::db_password*]
# Password to connect to database with.
#
# [*galaxy-roles-profiles::profile::db_database*]
# Name of the database (schema in postgres, database name in mysql).
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
class galaxy-roles-profiles::profile::database(){

  $db_database = hiera ('galaxy-roles-profiles::profile::db_database')
  $db_user     = hiera('galaxy-roles-profiles::profile::db_username')
  $db_pd = hiera('galaxy-roles-profiles::profile::db_password')

  class { 'postgresql::server': }
  postgresql::server::db { $db_database :
    user     => $db_user ,
    password => postgresql_password( $db_user, $db_pd ),
  }
}
