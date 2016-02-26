class ambari::server (
  $ambari_user            = 'root',
  $use_repo               = false,
  $initial_install        = true,
  $default_install        = true,
  $db_backend             = undef,
  $db_host                = undef,
  $db_port                = undef,
  $db_username            = undef,
  $db_password            = undef,
  $db_mysql_driver_url    = $::ambari::params::jdbc_driver_url,
  $db_manage_installation = false,
  $settings               = {}
) inherits ::ambari::params {

  # input validation
  validate_bool($use_repo)
  validate_bool($default_install)

  # validate
  if !$default_install {
    validate_re($db_backend, ['mysql', 'postgresql'])
    validate_str($db_host)
    validate_str($db_port)
    validate_str($db_username)
    validate_str($db_password)
  }

  case $db_backend {
    'mysql': {
      class { '::ambari::server::db::mysql':
        manage_installation => $db_manage_installation,
        jdbc_driver_url     => $db_mysql_driver_url
      }
      if $initial_install {
        Class['::ambari::server::db::mysql'] ->
        Class['::ambari::server::setup']
      }
    }
    default: {}
  }

  anchor { '::ambari::server::start': } ->
  class { '::ambari::server::package':
    use_repo => $use_repo
  } ->
  class { '::ambari::server::service': } ->
  anchor { '::ambari::server::stop': }

  if $initial_install {
    Class['::ambari::server::package'] ->
    class { '::ambari::server::setup':
      default_install => $default_install,
      db_backend      => $db_backend,
      db_host         => $db_host,
      db_port         => $db_port,
      db_username     => $db_username,
      db_password     => $db_password
    } ->
    Class['::ambari::server::service']
  }

}
