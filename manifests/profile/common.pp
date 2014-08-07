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
class galaxy_roles_profiles::profile::common{
  include ::galaxy
  include galaxy::install
  include galaxy::directories
  include galaxy::universe
  include galaxy::toolshed_conf
  if $galaxy::universe::wk_config == true  {
    include galaxy::job_conf
  }
  include galaxy::common_startup
  include galaxy::manage_tools
}
