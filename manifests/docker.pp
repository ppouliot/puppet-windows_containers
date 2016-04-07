# == Class: windows_containers::docker
#   Translation of steps to install docker on windows here:
#   https://msdn.microsoft.com/en-us/virtualization/windowscontainers/deployment/docker_windows

class windows_containers::docker {

  vcsrepo{'C:/PrograData/docker'
    ensure => 'present',
    source => 'https://github.com/docker/docker',
    revision => 'v1.11.0-rc4',
  }

}
