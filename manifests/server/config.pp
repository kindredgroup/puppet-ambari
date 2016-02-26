class ambari::server::config (
  $owner      = 'root',
  $db_backend = '',
  $settings   = {}
) {

  file { '/etc/ambari-server/conf/ambari.properties':
    ensure => file,
    owner  => $owner,
    group  => $owner,
    mode   => '0644'
  }

  $defaults = {
    path              => '/etc/ambari-server/conf/ambari.properties',
    key_val_separator => '='
  }

  create_ini_settings({ '' =>
    $settings
    },
    $defaults
  )

  case $db_backend {
    'mysql': {
      $db_settings = { '' => {
        'server.jdbc.database'   => 'mysql',
        'server.jdbc.driver'     => 'com.mysql.jdbc.Driver',
        'server.jdbc.rca.driver' => 'com.mysql.jdbc.Driver'
        }
      }
      create_ini_settings($db_settings, $defaults)
    }
    default: {}
  }

  # run ambari as user $owner
  create_ini_settings({ '' => {
    'ambari-server.user' => $owner
    }},
    $defaults
  )

  File['/etc/ambari-server/conf/ambari.properties'] -> Ini_setting <| |>

}
