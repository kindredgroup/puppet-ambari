class ambari::agent::config() {

  $ambari_server = $::ambari::agent::ambari_server
  $ambari_server_port = $::ambari::agent::ambari_server_port
  $ambari_server_secure_port = $::ambari::agent::ambari_server_secure_port

  file { '/etc/ambari-agent/conf/ambari-agent.ini':
    ensure  => 'file',
    owner   => 'root',
    group   => 'root',
    mode    => '0640',
    content => template('ambari/agent/ambari-agent.ini.erb'),
    require => Class['::ambari::agent::install'],
    notify  => Service[$::ambari::agent::service_name],
  }

}
