class {'::ambari::server':
  use_repo   => true,
  db_backend => 'mysql'
}
