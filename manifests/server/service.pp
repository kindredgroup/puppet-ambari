class ambari::server::service (
  $service_name   = $::ambari::params::service_name,
  $service_ensure = $::ambari::params::service_ensure,
  $service_enable = $::ambari::params::service_enable,
) inherits ::ambari::params {

  if $::osfamily == 'RedHat' {
    # ambari-server-2.1.2.1-418.x86_64 init script is not LSB compliant so this is the workaround
    Service[$service_name] {
      hasstatus => false,
      pattern   => 'java .*org\.apache\.ambari\.server\.controller\.AmbariServer'
    }
  }

  service { $service_name:
    ensure => $service_ensure,
    enable => $service_enable
  }

}
