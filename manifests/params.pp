# == Class: windows_containers::params
class windows_containers::params {
  case $kernel {
    'windows':{
      case $kernelmajversion {
        '10.0':{

          $ensure  = present,
          $restart = true,

        }
        default:{
          fail("The Windows Platform with kernel version ${kernelmajversion} is not currently supported.")
        }
      }
    }
    default:{
      fail("This module is not for use with non Windows based kernels such as ${::kernel}")
    }
  }
}
