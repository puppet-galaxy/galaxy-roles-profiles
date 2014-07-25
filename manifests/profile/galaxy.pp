class galaxy_roles_profiles::profile::galaxy{
  include ::galaxy
  include galaxy::install
  class { "galaxy::universe":
    id_secret => hiera("galaxy::universe::id_secret"),
    require_login => hiera("galaxy::universe::require_login"),
  }
  include galaxy::toolshed_conf
  if $galaxy::universe::wk_config == true  {
    include galaxy::job_conf
  }
  include galaxy::common_startup
  include galaxy::service
}
