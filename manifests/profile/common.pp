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
  class { 'galaxy':  
  }->
  class { 'galaxy::install':
  }->
  class { 'galaxy::common_startup':
  }->
  class { 'galaxy::universe':
  }->
  class { 'galaxy::toolshed_conf':
  }
  if galaxy::universe::wk_config == true  {
    class { 'galaxy::job_conf':
    }
  }
  
}
