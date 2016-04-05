# == Class: windows_containers::deploy
#   See https://msdn.microsoft.com/en-us/virtualization/windowscontainers/deployment/deployment
#   for more deployment information
class windows_containers::deploy (){

  # Install the container features
  notice("${module_name}: Hyper-V & Container Features")
  if ($windows_containers::hyperv_container_host){
    notice("${module_name} deploying Hyper-V Features")
    class{'hyper_v':} 
  } 

  notice("${module_name} deploying Container Feature")
  windowsfeature{'containers':
    ensure => $windows_containers::ensure
    restart => true,
  }

  # configure the virtual switch using the puppet-hyper_v virtualswitch type
  notice("${module_name}: Configure VirtualSwitch for Windows Containers")
  virtual_switch { 'container-virtual-switch':
    notes             => "This virtual switch is managed by puppet module ${module_name}",
    type              => External,
    os_managed        => true,
    interface_address => $::ipaddress,
  } ->
  
  # Configure NAT 
  notice("${module_name}: NAT Configuration")
#  exec{'create_windows_container_nat_config':
#    command  => 'New-NetNat -Name ContainerNat -InternalIPInterfaceAddressPrefix "172.16.0.0/12"',
#    provider => powershell,
#  }
  # Install Container OS images 
  notice("${module_name}:Enabling Windows Container OS Image Creation")
  exec{'install_package_provider-container_provider':
    command  => 'Install-PackageProvider ContainerProvider -Force',
    provider => powershell,
  }

  if windows_containers::nanoserver {
    exec{'Install NanoServer Container Image':
      command  => 'Install-ContainerImage -Name NanoServer -Version 10.0.10586.0',
      provider => powershell,
      require  => Exec['install_package_provider-container_provider'],
    }
  }

  if windows_containers::windowsservercore {
    exec{'Install Windows Server Core Container Image':
      command  => 'Install-ContainerImage -Name WindowsServerCore -Version 10.0.10586.0',
      provider => powershell,
      require  => Exec['install_package_provider-container_provider'],
    }
  }
  # Install Docker
  notice("${module_name}: Docker Installation")

}
