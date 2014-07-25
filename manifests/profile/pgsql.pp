# == Class: galaxy_roles_profiles::profile::database
#
# Database profile to build one database for PostgreSQL.
# See https://forge.puppetlabs.com/puppetlabs/postgresql/3.3.3 for more information
#
# === Parameter
#
# All are sets by Hiera
# [*galaxy_roles_profiles::profile::db_username*]
# Username to connect to database with. It is recommend you create a separate user for galaxy. We recommend use of the puppetlabs database modules to manage database users.
#
# [*galaxy_roles_profiles::profile::db_password*]
# Password to connect to database with.
#
# [*galaxy_roles_profiles::profile::db_database*]
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
class galaxy_roles_profiles::profile::pgsql(
  $db_name = undef,
  $db_user = undef,
  $db_pass = undef,
){
  if !($db_name or $db_user or $db_pass ){
    fail ('$db_user , $db_name or $db_pass is unset.If you want to use PostgreSQL, please ensure that these variables are correctly set. 
    Be sure these are the same in the database URL for Galaxy.')
  }
  $app_directory = hiera("galaxy::universe::app_directory" )
  class { 'postgresql::server': 
  }->
  postgresql::server::db { $db_name :
    user     => $db_user ,
    password => postgresql_password( $db_user, $db_pass ),
  }->
  class { 'galaxy::create_db':
  } 
}
