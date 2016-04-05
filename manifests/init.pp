# == Class: windows_containers
#
# Full description of class windows_containers here.
#
# === Parameters
#
# Document parameters here.
#
# [*ensure*]
# [*restart*]
# [*container_host*]
# [*hyperv_container_host*]
# [*container_image_repo_location*]
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { 'windows_containers':
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2016 Your name here, unless otherwise noted.
#
class windows_containers (

  $ensure                        = $windows_containers::params::ensure,
  $container_host                = $windows_containers::params::container_host,
  $hyperv_container_host         = $windows_containers::params::hyperv_container_host,
  $container_image_repo_location = $windows_containers::params::container_image_repo_location,
  $nanoserver                    = $windows_containers::params::nanoserver,
  $windowsservercore             = $windows_containers::params::windowsservercore,

) inherits windows_containers::params {

  validate_re($ensure, '^(present|absent)$', 'valid values for ensure are \'present\' or \'absent\'')
  
  if $hyperv_container_host {
    validate_bool($hyperv_container_host)
  }
  if $nanoserver {
    validate_bool($nanoserver)
  }
  if $windowservercore {

    validate_bool($windowsservercore)
  }
  class{'windows_containers::deploy':} ->
  class{'windows_containers::config':}

}
