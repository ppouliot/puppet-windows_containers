# == Class: windows_containers::docker
#   Translation of steps to install docker on windows here:
#   https://msdn.microsoft.com/en-us/virtualization/windowscontainers/deployment/docker_windows
#   https://msdn.microsoft.com/en-us/virtualization/windowscontainers/docker/configure_docker_daemon?f=255&MSPPError=-2147217396 

class windows_containers::docker {
  package{'unzip':
    ensure => 'latest',
  } -> 
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
    source  => 'https://download.docker.com/components/engine/windows-server/cs-1.12/docker.zip',
    target  => 'C:\Program Files',
    creates => [
      'C:\Program Files\docker',
      'C:\Program Files\docker\docker.exe',
      'C:\Program Files\docker\dockerd.exe',
    ],
  } ->
  acl{'c:\Program Files\docker':
    permissions => [
      { identity => 'Administrator', rights => ['full'] },
      { identity => 'Administrators', rights => ['full'] },
    ],
    require     => Class['staging'],
  } ->
  windows_path {'C:\Program Files\docker':
    ensure => present,
  } ->

  exec {'dockerd_register_service':
    command   => 'cmd.exe /c "C:\\Program Files\\docker\\dockerd.exe" --register-service',
    cwd       => 'C:/Program Files/docker',
    path      => $::path,
    logoutput => true,
    unless    => 'cmd.exe /c sc.exe query docker',
  } ->

  service{'docker':
    ensure => running,
    enable => true,
  }


#  vcsrepo{'C:/PrograData/docker':
#    ensure => 'present',
#    source => 'https://github.com/docker/docker',
#    revision => 'v1.11.0-rc4',
#  }

}
