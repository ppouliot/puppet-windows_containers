# == Class: windows_containers::docker
#   Translation of steps to install docker on windows here:
#   https://msdn.microsoft.com/en-us/virtualization/windowscontainers/deployment/docker_windows
#   https://msdn.microsoft.com/en-us/virtualization/windowscontainers/docker/configure_docker_daemon?f=255&MSPPError=-2147217396 

class windows_containers::docker {
  class{'staging':
    path    => 'C:/programdata/staging',
    owner   => 'Administrator',
    group   => 'Administrator',
    mode    => '0777',
    require => Package['unzip'],
  } ->

  acl{'c:\ProgramData\staging':
    permissions => [
      { identity => 'Administrator', rights => ['full'] },
      { identity => 'Administrators', rights => ['full'] },
    ],
    require     => Class['staging'],
  }

  staging::deploy {'docker.zip':
    source => 'https://download.docker.com/components/engine/windows-server/cs-1.12/docker.zip'
    target => 'C:\Program Files\Docker',
  }

  vcsrepo{'C:/PrograData/docker'
    ensure => 'present',
    source => 'https://github.com/docker/docker',
    revision => 'v1.11.0-rc4',
  }

}
