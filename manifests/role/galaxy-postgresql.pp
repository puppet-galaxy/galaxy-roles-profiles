#
#
#
#
#
class galaxy_roles_profiles::role::galaxy-postgresql{
  class { 'galaxy_roles_profiles::profile::common':
  }->
  class { 'galaxy_roles_profiles::profile::pgsql':
  }->
  class { 'galaxy_roles_profiles::profile::galaxy':
  }
}
