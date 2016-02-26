class ambari::server::service (
  $service_name   = $::ambari::params::service_name,
  $service_ensure = $::ambari::params::service_ensure,
  $service_enable = $::ambari::params::service_enable,
) inherits ::ambari::params {

  service { $service_name:
    ensure => $service_ensure,
    enable => $service_enable
  }

}
