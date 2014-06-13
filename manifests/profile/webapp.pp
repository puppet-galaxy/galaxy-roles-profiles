# == Class galaxy-roles-profiles::profile::webapp
#
# Manage severs with apache.
class galaxy-roles-profiles::profile::webapp(){
  include apache
  include apache::proxy
  include apache::mod::rewrite
  apache::balancermember{ 'web0':
    url              => 'http://localhost:8000',
    balancer_cluster => 'galaxy',
  }
  apache::balancermember{ 'web1':
    url              => 'http://localhost:8001',
    balancer_cluster => 'galaxy',
  }

  apache::balancer{ 'galaxy':
    name             => 'galaxy',
    collect_exported => false,
  }
}
