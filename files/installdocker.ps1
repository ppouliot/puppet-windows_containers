# Install Docker
Install-Module -Name DockerMsftProvider -Repository PSGallery -Force -A
Install-Package -Name docker -ProviderName DockerMsftProvider -A
Start-Service docker
Invoke-WebRequest https://dl.bintray.com/docker-compose/master/docker-compose-Windows-x86_64.exe -UseBasicParsing -OutFile $env:ProgramFiles\docker\docker-compose.exe
Restart-Computer -Force
