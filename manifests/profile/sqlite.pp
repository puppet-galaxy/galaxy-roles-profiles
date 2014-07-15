class galaxy_roles_profiles::profile::sqlite{
  $app_directory = $galaxy::params::app_directory
  include galaxy::create_db
}
