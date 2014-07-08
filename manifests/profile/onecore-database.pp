class galaxy_roles_profiles::profile::onecore-database {
  galaxy::universe { 'onecore-database':
      directory            => hiera('galaxy_roles_profiles::profile::app_directory'),
      id_secret            => hiera('galaxy_roles_profiles::profile::id_secret'),
      db_config            => true,
      db_driver            => hiera('galaxy_roles_profiles::profile::db_driver'),
      db_host              => hiera('galaxy_roles_profiles::profile::db_host'),
      db_port              => hiera('galaxy_roles_profiles::profile::db_port'),
      db_opts_pool_size    => hiera('galaxy_roles_profiles::profile::db_opts_pool_size'),
      db_opts_max_overflow => hiera('galaxy_roles_profiles::profile::db_opts_max_overflow'),
      db_username          => hiera('galaxy_roles_profiles::profile::db_username'),
      db_password          => hiera('galaxy_roles_profiles::profile::db_password'),
      db_database          => hiera('galaxy_roles_profiles::profile::db_database'),
  }
}
