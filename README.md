# windows_containers

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Usage - Configuration options and additional functionality](#usage)
4. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)
7. [License - Copyright and License](#license)

## Overview
Windows Server 2016 now supports Container Technology, this puppet module 
configures Windows container technology and Docker APIs on Windows 2016 Server


## Module Description
This Puppet module deploys and configures Microsoft's Container Technology


## Usage
  ```
  class{'windows_containers':}

  ```
## Reference
* https://azure.microsoft.com/en-us/blog/containers-docker-windows-and-trends/
* https://msdn.microsoft.com/en-us/virtualization/windowscontainers/deployment/deployment
* https://raw.githubusercontent.com/Microsoft/Virtualization-Documentation/live/windows-server-container-tools/New-ContainerHost/New-ContainerHost.ps1
* https://raw.githubusercontent.com/Microsoft/Virtualization-Documentation/live/hyperv-tools/Convert-WindowsImage/Convert-WindowsImage.ps1



### Classes
* `windows_containers`: Main Class
* `windows_containers::params`: Sets the defaults for the windows_containers module parameters
* `windows_containers::deploy`: Deploys the necessary features and tools for Windows Containers on Server 2016
* `windows_containers::config`: A placeholder class for processing
* `windows_containers::docker`: Installs and configures Docker APIs for Windows Server Containers
* `windows_containers::hyper_v_container`: Defines a Hyper-V Container
* `windows_containers::windows_server_container`: Defines a Windows Server Container

config.pp  deploy.pp  docker.pp  hyper_v_container.pp  init.pp  params.pp  windows_server_container.pp

## Limitations

* Windows Server 2016

## Development

Since your module is awesome, other users will want to play with it. Let them
know what the ground rules for contributing are.

## Release Notes/Changelog

If you aren't using changelog, put your release notes here (though you should
consider using changelog). You may also add any additional sections you feel are
necessary or important to include here. Please use the `## ` header.

## Contributors
* Peter Pouliot <peter@pouliot.net>

## License

Copyright (C) 2016 Peter J. Pouliot

Peter Pouliot can be contacted at: peter@pouliot.net

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

  http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
