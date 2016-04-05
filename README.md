puppet-windows_containers
==============
This module contains basic configuration tasks for using Containers on the Windows Server 2016 platform. It is still a work in progress project with the following implemented functionality:

 1. Install Containers features.

Basic usage
-----------
The basic scenario allows the user to configure the **Containers role** and the additional tools:

    class { 'windows_containers':
      ensure => present,
    }

Contributors
------------
 * Peter Pouliot <peter@pouliot.net>

Copyright and License
---------------------

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

