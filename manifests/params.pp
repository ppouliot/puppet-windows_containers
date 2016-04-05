# == Class: windows_containers::params
class windows_containers::params {
  case $kernel {
    'windows':{
      case $kernelmajversion {
        '10.0':{

          $ensure                        = present
          $hyperv_container_host         = undef
          $container_host                = $::hostname
          $container_image_repo_location = 'C:\\ProgramData\\Microsoft\\Windows\\Hyper-V\\Container Image Store'

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
