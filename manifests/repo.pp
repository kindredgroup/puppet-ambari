class ambari::repo {

  include ::ambari

  if $::osfamily == 'RedHat' {
    wget::fetch { 'ambari_yum_repo':
      source      => "http://public-repo-1.hortonworks.com/ambari/centos${::operatingsystemmajrelease}/${::ambari::repo_version}/updates/${::ambari::version}/ambari.repo",
      destination => '/etc/yum.repos.d/ambari.repo',
      execuser    => 'root',
      mode        => '0644'
    }
  }

}
