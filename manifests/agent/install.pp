class ambari::agent::install() {

  if str2bool($::ambari::agent::use_repo) {
    contain ::ambari::repo
    Class['::ambari::repo'] -> Package[$::ambari::agent::package_name]
  }

  package { $::ambari::agent::package_name:
    ensure => $::ambari::agent::package_ensure,
  }

}
