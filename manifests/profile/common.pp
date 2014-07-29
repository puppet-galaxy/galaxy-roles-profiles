#
#
#
#
#
#
#
#
#
#
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
}
