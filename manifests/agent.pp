class ambari::agent(
  $use_repo     = false,
  $package_name = $::ambari::params::agent_pkg_name ) {

  if str2bool($use_repo) {
    contain ::ambari::repo
    Class['::ambari::repo'] -> Package[$package_name]
  }

  package { $package_name:
    ensure => installed,
  }

}
