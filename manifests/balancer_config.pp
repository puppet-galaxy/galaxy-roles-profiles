define galaxy-roles-profiles::balancer_config(
  $directory = /etc/apache2/conf.d/
  $balancer_name = 'galaxy'
  $webworker_starting_port_number= 8000
){
  $number_of_web_workers_array = range("0", -1+hiera('galaxy-roles-profiles::number_of_workers'))
  file { "$directory/balancer_galaxy.conf":
    content => template("galaxy-roles-profiles/balancer_galaxy.conf.erb"),
  }
}
