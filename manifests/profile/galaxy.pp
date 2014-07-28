class galaxy_roles_profiles::profile::galaxy{
  include ::galaxy
  class { "galaxy::dependencies":
  } ->
  class { "galaxy::install":
  } ->
  class { "galaxy::universe":
    id_secret => hiera("galaxy::universe::id_secret"),
    require_login => hiera("galaxy::universe::require_login"),
  } ->
  class { "galaxy::toolshed_conf":
  } ->
  class { "galaxy::job_conf":
  } ->
  class { "galaxy::service":
  }
}
