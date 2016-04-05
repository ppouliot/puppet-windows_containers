# == Class::windows_containers::hyper_v_container
#   see the url: https://azure.microsoft.com/en-us/blog/containers-docker-windows-and-trends/
class windows_containers::hyper_v_container {
  notice('Hyper-V Containers take a slightly different approach to containerization. To create more isolation, Hyper-V Containers each have their own copy of the Windows kernel and have memory assigned directly to them, a key requirement of strong isolation. We use Hyper-V for CPU, memory and IO isolation (like network and storage), delivering the same level of isolation found in VMs. Like for VMs, the host only exposes a small, constrained interface to the container for communication and sharing of host resources. This very limited sharing means Hyper-V Containers have a bit less efficiency in startup times and density than Windows Server Containers, but the isolation required to allow untrusted and “hostile multi-tenant” applications to run on the same host.')
}
