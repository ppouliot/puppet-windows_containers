# == Class::windows_containers::windows_server_container
#  See https://azure.microsoft.com/en-us/blog/containers-docker-windows-and-trends/ for more info
class windows_containers::windows_server_container {
  notice ('There’s the question of when you might want to use a Windows Server Container versus a Hyper-V Container. While the sharing of the kernel enables fast start-up and efficient packing, Windows Server Containers share the OS with the host and each other. The amount of shared data and APIs means that there may be ways, whether by design or because of an implementation flaw in the namespace isolation or resource governance, for an application to escape out of its container or deny service to the host or other containers. Local elevation of privilege vulnerabilities that operating system vendors patch is an example of a flaw that an application could leverage.  Thus, Windows Server Containers are great for scenarios where the OS trusts the applications that will be hosted on it, and all the applications also trust each other. In other words, the host OS and applications are within the same trust boundary. That’s true for many multi-container applications, applications that make up a shared service of a larger application, and sometimes applications from the same organization.')
}