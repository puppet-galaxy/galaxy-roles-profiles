#Galaxy roles profiles
####Tables of Contents
1. [Overview](#overview)
2. [Module Description](#module-description)
3. [Setup](#setup)
    * [First step with Puppet Galaxy](#start-with-galaxy)
4. [Available Roles for quick start](#roles)
    * [Role galaxy-roles-profiles::role::basic](#role-basic)
5. [Classes](#classes)
    * [Class galaxy-roles-profiles::profile::base](#class-base)
6. [Deal with Hiera configuration files](#hiera)   
7.[Contact](#contact)
8.[Galaxy Project](#galaxy)

##Overview
This module install and configure a new instance of Galaxy. Today, there is three roles (three configuration) you can choose.

##Module Description
This is the galaxy-roles-profiles module. Galaxy is an open, web-based platform for accessible, reproducible, and transparent computational biomedical research.
This module contains roles and profiles for a Galaxy server configuration management.
It uses base blocks hosted in the Galaxy module: https://forge.puppetlabs.com/urgi/galaxy

##Setup

**what this module affect:**
* Create a new user, galaxy
* Create directories
* Manage configurations files
* Enable apache
 * see https://forge.puppetlabs.com/puppetlabs/apache for further information
###First step
How to install existing role:

```puppet
	include galaxy-roles-profiles::role::<the role wich you want>
```
##Available Roles 

###Role galaxy-roles-profiles::role::basic
```puppet
	include galaxy-roles-profiles::role::basic
```

##Github projects
Projects for base blocks and roles+profiles are hosted on github:


https://github.com/puppet-galaxy/puppet-galaxy


https://github.com/puppet-galaxy/galaxy-roles-profiles

##Contact

Mikael Loaec    mloaec@versailles.inra.fr


Olivier Inizan  oinizan@versailles.inra.fr


Eric Rasche     rasche.eric@yandex.ru

##Galaxy Project
http://galaxyproject.org
