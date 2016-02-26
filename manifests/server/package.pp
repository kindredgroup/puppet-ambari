class ambari::server::package (
  $package_name = 'ambari-server',
  $use_repo     = false
) {

  if $use_repo {
    include ::ambari::repo
    Class['::ambari::repo'] -> Package[$package_name]
  }

  package { $package_name:
    ensure => installed
  }

}
