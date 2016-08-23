class ambari::agent::service () {

  service { $::ambari::agent::service_name:
    ensure => $::ambari::agent::service_ensure,
    enable => $::ambari::agent::service_enable,
  }

}
