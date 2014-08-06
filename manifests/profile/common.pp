# == Class galaxy_roles_profiles::profile::common
#
# This class call basic blocks from module urgi/galaxy
# to install,configure and prepare a new instance of Galaxy
#
# ==== Examples
#
# include galaxy_roles_profiles::profile::common
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
class galaxy_roles_profiles::profile::common {
  include ::galaxy
  include galaxy::install
  include galaxy::universe
  include galaxy::toolshed_conf
  if $galaxy::universe::wk_config == true  {
    include galaxy::job_conf
  }
  include galaxy::common_startup
  include galaxy::manage_tools
  $directory = '/home/galaxy/galaxy-dist'
  $paths= [
          "$directory/database/files",
          "$directory/database/job_working_directory",
          "$directory/database/pbs",
          "$directory/database/tmp",
          "$directory/database/ftp",
          "$directory/database/compiled_templates",
          "$directory/database/whoosh_indexes",
          "$directory/database/object_store_object",
          "$directory/static/genetrack/plots",
          "$directory/tool-data/shared/jars",
          ]
      file  {$paths:
        require => Class['galaxy::install'],
        ensure  => directory,
        owner   => 'galaxy',
        group   => 'galaxy',
        mode    => 'a=r+w+x'
      }
}
