#
class galaxy-roles-profiles::role::multicore(){
  class{ 'galaxy-role-profiles::profile::common':
    config => "mutlicore",
  }
  class{ 'galaxy-role-profiles::profile::webapp': }	
}

