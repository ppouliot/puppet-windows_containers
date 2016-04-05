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
          fail("${module_name} requires Windows Server 2016 or newer.")
        }
      }
    }
    default:{
      fail("${module_name} only works on Windows based kernels!")
    }
  }
}
